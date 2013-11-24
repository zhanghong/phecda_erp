require 'taobao_fu'

require 'yaml'
YAML::ENGINE.yamler = 'syck'

config_file = File.join(Rails.root, "config", "taobao.yml")
TaobaoFu.load(config_file) if FileTest::exists?(config_file)

select_source_function = %q{
	def self.select_app_session(app_session)
    settings = {}
    settings['app_key'] = app_session.app_key
    settings['secret_key'] = app_session.app_secret
    settings['session'] = app_session.session_key
    settings['is_sandbox'] = app_session.is_sandbox
    TaobaoFu.settings = settings
  end
}

TaobaoFu.module_eval(select_source_function)