class ArrayInt
    def sum(arr)
        for i in arr do
            if arr.length() == 3
                i += 1
                result = [arr[0], arr[1], i] 
            elsif arr.length() == 2
                if arr[-1] != 9
                    i += 1
                    result = [arr[0], i]
                end
            elsif arr.length() == 1
                if arr[-1] != 9
                    i += 1
                    result = [i]
                else
                    i = 0
                    result = [1,i]
                end
            end
        end
        return result
    end
end