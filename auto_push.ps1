param (
# 分支名
    [string] $branch = "main",
# 等待时间，单位秒，0表示不等待
    [int] $time = 5,
# 提交信息，默认为 feat: automation daily update
    [string] $commitMessage = "feat: automation daily update"  # 默认提交信息
)


function Push-Auto {
    param (
        [string] $branch,
        [int] $time,
        [string] $commitMessage
    )
    try {
        git pull origin $branch;
        git add .;
        git commit -m $commitMessage;
        git push -u origin $branch;
        if ($time -eq 0) {
            Write-Host "push success, Waiting for seconds to clear the terminal..." -ForegroundColor Green
            Start-Sleep -s 4 ;
            Clear-Host
        }
        else {
            Write-Host "push success, Waiting for $time seconds to clear the terminal..." -ForegroundColor Green
            Start-Sleep -s $time ;
            Clear-Host
        }
    }
    catch {
        Write-Host "push failed, please check your network or git config" -ForegroundColor Red
    }
}

Push-Auto -branch $branch -time $time -commitMessage $commitMessage