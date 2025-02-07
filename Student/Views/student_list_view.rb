require 'fox16'
require_relative '../Controllers/student_list_controller'
require_relative '../DataList/data_list'
require_relative '../DataList/data_list_student_short'

include Fox

class StudentsListView < FXMainWindow
  attr_accessor :students_per_page, :current_page, :controller

  def initialize(app, controller: nil)
    super(app, 'Список студентов', width: 1024, height: 542, opts: DECOR_ALL)
    @students_per_page = 20
    @current_page = 1
    @controller = StudentsListController.new(self)

    FXToolTip.new(self.getApp())

    create_main_layout
    create_content_section
    create_pagination_controls

    show(PLACEMENT_SCREEN)

    @controller.refresh_data
  end

  def set_table_params(get_names, whole_entities_count)
    return if get_names.nil? || get_names.empty?

    @table.setTableSize(0, get_names.size) # Устанавливаем количество колонок
    get_names.each_with_index { |name, index| @table.setColumnText(index, name) }

    @total_pages = (whole_entities_count.to_f / @students_per_page).ceil
    @page_label.text = "Страница #{@current_page} из #{@total_pages}"
  end

  def set_table_data(data_table)
    return if data_table.nil? || data_table.row_count.zero?

    @table.setTableSize(data_table.row_count, data_table.column_count)
    data_table.row_count.times do |i|
      data_table.column_count.times do |j|
        @table.setItemText(i, j, data_table.get_element(i, j).to_s)
      end
    end
    adjust_column_widths
  end

  def refresh_view
    @controller.refresh_data if @controller
  end

  private

  def create_main_layout
    @sections = FXVerticalFrame.new(self, opts: LAYOUT_FILL)
    FXLabel.new(@sections, 'Список студентов', opts: JUSTIFY_CENTER_X | LAYOUT_FILL_X)
  end

  def create_content_section
    content_frame = FXHorizontalFrame.new(@sections, opts: LAYOUT_FILL)

    table_frame = FXVerticalFrame.new(content_frame, opts: LAYOUT_FILL)
    @table = FXTable.new(table_frame, opts: LAYOUT_FILL | TABLE_COL_SIZABLE | TABLE_ROW_SIZABLE)
    @table.setTableSize(0, 4)
    @table.editable = false

    control_frame = FXVerticalFrame.new(content_frame, opts: LAYOUT_FIX_WIDTH, width: 250, padLeft: 10)
    FXButton.new(control_frame, 'Добавить', nil, nil, 0, opts: FRAME_RAISED | BUTTON_NORMAL | LAYOUT_FILL_X)
    FXButton.new(control_frame, 'Изменить', nil, nil, 0, opts: FRAME_RAISED | BUTTON_NORMAL | LAYOUT_FILL_X)
    FXButton.new(control_frame, 'Удалить', nil, nil, 0, opts: FRAME_RAISED | BUTTON_NORMAL | LAYOUT_FILL_X)
    FXButton.new(control_frame, 'Обновить', nil, nil, 0, opts: FRAME_RAISED | BUTTON_NORMAL | LAYOUT_FILL_X).connect(SEL_COMMAND) { refresh_view }

    filter_frame = FXVerticalFrame.new(control_frame, opts: LAYOUT_FILL_X | LAYOUT_CENTER_X)

    FXLabel.new(filter_frame, 'ФИО')
    @fio_input = FXTextField.new(filter_frame, 25, opts: FRAME_SUNKEN | LAYOUT_FILL_X)

    FXLabel.new(filter_frame, 'Гит')
    @git_combo = FXComboBox.new(filter_frame, 15, opts: COMBOBOX_STATIC | FRAME_SUNKEN | LAYOUT_FILL_X)
    @git_combo.numVisible = 3
    @git_combo.appendItem('Да')
    @git_combo.appendItem('Нет')
    @git_combo.appendItem('Не важно')
    @git_combo.setCurrentItem(2)

    # Поле для ввода поиска по GitHub
    @git_search_input = FXTextField.new(filter_frame, 25, opts: FRAME_SUNKEN | LAYOUT_FILL_X)
    @git_search_input.disable # Отключаем по умолчанию

    # Обработчик изменения выбора в @git_combo
    @git_combo.connect(SEL_COMMAND) do
      if @git_combo.getItemText(@git_combo.currentItem) == 'Да'
        @git_search_input.enable
      else
        @git_search_input.disable
        @git_search_input.text = '' # Очищаем поле при отключении
      end
    end

    FXLabel.new(filter_frame, 'Контакт')
    @contact_combo = FXComboBox.new(filter_frame, 15, opts: COMBOBOX_STATIC | FRAME_SUNKEN | LAYOUT_FILL_X)
    @contact_combo.numVisible = 3
    @contact_combo.appendItem('Да')
    @contact_combo.appendItem('Нет')
    @contact_combo.appendItem('Не важно')
    @contact_combo.setCurrentItem(2)

    # Поле для ввода поиска по Контакту
    @contact_search_input = FXTextField.new(filter_frame, 25, opts: FRAME_SUNKEN | LAYOUT_FILL_X)
    @contact_search_input.disable # Отключаем по умолчанию

    # Обработчик изменения выбора в @contact_combo
    @contact_combo.connect(SEL_COMMAND) do
      if @contact_combo.getItemText(@contact_combo.currentItem) == 'Да'
        @contact_search_input.enable
      else
        @contact_search_input.disable
        @contact_search_input.text = '' # Очищаем поле при отключении
      end
    end
  end

  def create_pagination_controls
    pagination_frame = FXHorizontalFrame.new(@sections, opts: LAYOUT_FILL_X | LAYOUT_CENTER_X)

    @prev_button = FXButton.new(pagination_frame, '<<', nil, nil, 0, opts: FRAME_RAISED | BUTTON_NORMAL)
    @page_label = FXLabel.new(pagination_frame, "1", opts: LAYOUT_CENTER_X)
    @next_button = FXButton.new(pagination_frame, '>>', nil, nil, 0, opts: FRAME_RAISED | BUTTON_NORMAL)

    @prev_button.connect(SEL_COMMAND) { change_page(-1) }
    @next_button.connect(SEL_COMMAND) { change_page(1) }
  end

  def change_page(page)
    @controller.change_page(page)
  end

  def adjust_column_widths
    (0...@table.numColumns).each do |col|
      max_width = 50
      (0...@table.numRows).each do |row|
        cell_text = @table.getItemText(row, col)
        text_width = cell_text.length * 7
        max_width = [max_width, text_width].max
      end
      @table.setColumnWidth(col, max_width)
    end
  end
end