local status, auto_session = pcall(require, 'auto_session')
if not status then
  return
end

auto_session.setup({
  log_level = 'error',
  auto_session_suppress_dirs = { '~/', '~/Developer' },
})
