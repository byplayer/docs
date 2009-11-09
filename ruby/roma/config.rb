require 'roma/routing/rttable'
require 'roma/routing/cb_rttable'
require 'roma/storage/rh_storage'
require 'roma/storage/tc_storage'

module Roma
  
  module Config
    DEFAULT_PORT = 12000
    DEFAULT_NAME = 'YOUR_ROMA_NAME'

    # :no_action | :auto_assign | :shutdown
    DEFAULT_LOST_ACTION = :auto_assign

    # log setting
    LOG_SHIFT_AGE = 10
    LOG_SHIFT_SIZE = 1024 * 1024 * 10
    LOG_PATH = '/roma/YOUR_ROMA_NAME/logs'

    # routing setting
    RTTABLE_PATH = '/usr/local/roma/YOUR_ROMA_NAME/rttable'

    # storage setting
    STORAGE_CLASS = Roma::Storage::TCStorage
    STORAGE_DIVNUM = 10
    STORAGE_PATH = '/roma/YOUR_ROMA_NAME/storage'
    STORAGE_DUMP_PATH = '/tmp'
    STORAGE_OPTION = 'bnum=1000000#xmsiz=40000000#dfunit=10#opts=ld'

    # 5 days ago
    STORAGE_DELMARK_EXPTIME = 60 * 60 * 24 * 5

    # data copy setting
    DATACOPY_STREAM_COPY_WAIT_PARAM = 0.0001

    # plugin setting
    PLUGIN_FILES = []

    # write-behind setting
    WRITEBEHIND_PATH = '/roma/YOUR_ROMA_NAME/wb'
    WRITEBEHIND_SHIFT_SIZE = 1024 * 1024 * 10

    # redundant setting
    REDUNDANT_ZREDUNDANT_SIZE = 0

    def self.get_stat
      ret = {}
      ret['config.DEFAULT_LOST_ACTION'] = DEFAULT_LOST_ACTION
      ret['config.LOG_SHIFT_AGE'] = LOG_SHIFT_AGE
      ret['config.LOG_SHIFT_SIZE'] = LOG_SHIFT_SIZE
      ret['config.LOG_PATH'] = File.expand_path(LOG_PATH)
      ret['config.RTTABLE_PATH'] = File.expand_path(RTTABLE_PATH)
      ret['config.STORAGE_DELMARK_EXPTIME'] = STORAGE_DELMARK_EXPTIME
      ret['config.DATACOPY_STREAM_COPY_WAIT_PARAM'] = DATACOPY_STREAM_COPY_WAIT_PARAM
      ret['config.PLUGIN_FILES'] = PLUGIN_FILES.inspect
      ret['config.WRITEBEHIND_PATH'] = File.expand_path(WRITEBEHIND_PATH)
      ret['config.WRITEBEHIND_SHIFT_SIZE'] = WRITEBEHIND_SHIFT_SIZE
      ret
    end

  end

end
