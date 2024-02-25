local dbs = {
	-- {
	-- 	name = 'ems-postgres',
	-- 	url = 'postgres://postgres:57UOlLurgvYM3hy4wzkB4CJZhXSm8WLI@postgres.iem.svc:5432/platformportal'
	-- },
	{
		name = 'IE Twin - EMS',
		url = 'postgres://ietwin:12345678@localhost:5432/ie_twin'
	},
	{
		name = 'IE Twin - IED',
		url = 'sqlite:/home/jay/dev/work/device-twin-lib/.worktrees/refactor/example/db/twin.db'
	}
}

vim.g.dbs = dbs
