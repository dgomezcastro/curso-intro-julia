function ackermann(m, n)
    if m == 0
        return n + 1
    elseif m > 0 && n == 0
        return ack(m - 1, 1)
    else
        return ack(m - 1, ack(m, n - 1))
    end
end