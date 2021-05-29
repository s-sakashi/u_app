module ApplicationHelper
    # ページごとの完全なタイトルを返す
    def full_title(page_title = '')
        app_name = " - U"
        main_title = "U - 温泉探し情報サイト"
        if page_title.empty?
            main_title
        else
            page_title + app_name
        end
    end
end
