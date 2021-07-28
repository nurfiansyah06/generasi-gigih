class ArrayInt
    def sum(arr)
        for i in arr do
            if arr.length() == 3
                last_i = i + 1
                new_result = [arr[0], arr[1], last_i] 
            elsif arr.length() == 2
                last_i = i + 1
                new_result = [arr[0], last_i]
            elsif arr.length() == 1
                if arr[-1] != 9
                    last_i = i + 1
                    new_result = [last_i]
                else
                    last_i = i + 1
                    new_result = [last_i]
                end
            end
        end
        return new_result
    end
end