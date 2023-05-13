local status, notify = pcall(require, 'notify')
if (not status) then return end

vim.notify = notify

notify.setup {
  background_colour = "#000000",
  stages = "slide",
  timeout = 5000,
}

-- When Opening Nvim 
notify([[
　　　　|┃三　　　　 ∩＿＿＿∩
　　　　|┃　　　　　| ノ　　　ヽ
　　　　|┃　≡　 　/　　●　　 ● |　　きたクマー！
＿＿__.|ミ＼＿＿_|　　　( _●_)  ミ
　　　　|┃=＿＿＿　　　  |∪|　　　＼
　　　　|┃　≡　　/　　　　ヽノ　　人＼ ガラッ
]],
  vim.log.levels.INFO,
  {
    title = os.date("%m/%d/%y %H:%M") .. " " .. vim.env.USER,
    render = "simple",
  }
)
