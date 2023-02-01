local status, auto_session = pcall(require, 'auto_session')
if not status then
  return
end

auto_session.setup({
  log_level = 'error',
  auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
  auto_session_allpwed_dirs = { '~/Developer' },
  auto_session_use_git_branch = true,
})
