function show_result(name, nIters, te, isDryRun, isHeader)
%SHOW_RESULT Show result for one operation style

if isDryRun
    return;
elseif isHeader
    % Align 'μsec...' with 1s place instead of field beginning; looks better.
    %fprintf('%-30s  %-6s   %-6s \n', 'Operation', 'Total', '  Per Call (μsec)');
    fprintf('%-30s   %-12s \n', 'Operation', 'Time (msec)');
end

usecPerOp = (te * 10^3) / nIters;
%fprintf('%-30s  %6.3f  %6.3f \n', [name ':'], te, usecPerOp);
fprintf('%-30s  %12.3f \n', [name ':'], usecPerOp);

end
