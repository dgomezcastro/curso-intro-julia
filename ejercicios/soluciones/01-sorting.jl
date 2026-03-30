```
Implementation of a very naive sorter
```

function my_sort(v)
    if length(v) == 0
        return []
    else
        i = argmin(v)
        w = v[[1:i-1; i+1:end]]
        return [v[i]; my_sort(w)]
    end
end