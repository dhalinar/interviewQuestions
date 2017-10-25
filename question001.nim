#[

Given n bricks and a goal of stacking them into towers
How many combinations of towers can you make where:
- each successive tower is taller
- each tower has atleast one brick
- there are no left over bricks
]#

type
    CombError = ref object

proc combinations(n, min : int; comb: var seq[int]): int =
    ## Number of combinations where first tower's height is 'min'
    ## and there are 'n' bricks
    # echo "combinations n:", n, ", min:", min, " seq: ", comb

    # Not enough bricks to make minimum tower
    if n == 0:
        result = 0
    elif n < min:
      raise newException(ValueError, "Not enough bricks.")
    else:
      result = 1
    #   echo "n:", n, ", min:", min
      var i = n
      while i >= min:
        # echo "Subi:", i
        comb.add(i)
        let leftover = n - i
        try:
            let subcomb = combinations(leftover, i+1, comb)
            if subcomb == 0:
                echo comb
            result += subcomb # for any sub combinations (can be 0)
        except ValueError:
            continue
        finally:
            discard comb.pop()
            i -= 1 # decrement


    # elif n == min:
    #     comb.add(n)
    #     echo comb
    #     result = 1
    # else: 
    #     for i in min..n:
    #         echo "subi:", i
    #         comb.add(i)
    #         try:
    #             let sub = combinations(n-i, i+1, comb)
    #             result += sub
    #             # discard comb.pop()
    #         except ValueError:
    #             continue
            # discard comb.pop()
            

# proc combinations(n: int): int =
#     ## Count how many combinations can be made with 'n' bricks
#     result = 

when isMainModule:
    echo "Combinations:"
    for i in 1..10:
        var comb: seq[int] = @[]
        echo "-I:", i, " comb: ", comb
        echo "result:", combinations(i, 1, comb)