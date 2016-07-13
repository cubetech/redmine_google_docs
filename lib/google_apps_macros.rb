require 'redmine'
require 'digest/md5'
require 'yaml'
include ActionView::Helpers::JavaScriptHelper

module GoogleAppsMacros
  unloadable

  class DocumentMacros
    def self.get_doc(obj,args)
      wid = 800
      hei = 700
      if args.length > 1
        if args.length != 3
          raise "You will need two dimensions of iframe as arguments."
        else
          unless (args[1].to_i >= 300) && (args[2].to_i >= 300)
            raise "Dimensions must be integers, both >= 300."
          else
            wid = args[1]
            hei = args[2]
          end
        end
      end
      if args[0].start_with?("https://docs.google.com/")
        out = "<iframe frameborder='0' src='#{args[0]}' width='99%' height='#{hei}'></iframe></br><a href='#{args[0]}' target='_blank'>Öffne das Originaldokument in einem neuen Fenster</a>"
      else
        raise "It is not Google Apps document..."
      end
    end
  end
end
