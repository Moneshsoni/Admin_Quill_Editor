# README
#**Monesh soni ROR Developer**
This is active admin quill editor in rails 6.
# If your want to use in rails 5.x version than follow below steps

After installing Active Admin, add to your Gemfile: gem 'activeadmin_quill_editor' (and execute bundle)

If you installed Active Admin without Webpacker support (default for now):

Add at the end of your Active Admin styles (app/assets/stylesheets/active_admin.scss):
@import 'activeadmin/quill_editor/quill.snow';
@import 'activeadmin/quill_editor_input';

Add at the end of your Active Admin javascripts (app/assets/javascripts/active_admin.js):
//= require activeadmin/quill_editor/quill
//= require activeadmin/quill_editor_input

If you installed Active Admin with Webpacker support:

Execute in your project root:

yarn add blocknotes/activeadmin_quill_editor
#This path is not correct in rails 5.2.3 version in rails 
#If we give this path as declare documentation not working that #is working fine for rails 6.x but not 5
<h1> Right path for rails 5.x version</h1>
Add to your app/javascript/packs/application.js:
require('activeadmin_quill_editor')
Usage

#This path is alternative if above not working .

Add to your app/javascript/packs/active_admin.js:
require('activeadmin_quill_editor')
Usage

In your Active Admin models, form configuration, set the text inputs with as: :quill_editor where needed.

data-options: permits to set quill editor options directly - see options list

Examples
Basic usage
# Active Admin article form conf:
  form do |f|
    f.inputs 'Article' do
      f.input :title
      f.input :description, as: :quill_editor
      f.input :published
    end
    f.actions
  end
Toolbar buttons configuration
f.input :description, as: :quill_editor, input_html: { data: { options: { modules: { toolbar: [['bold', 'italic', 'underline'], ['link']] }, placeholder: 'Type something...', theme: 'snow' } } }
ImageUploader plugin
This plugin allows to upload images to the server (instead of storing them in base64 by default), reference here.

# Upload method (to be included in the admin entity configuration)
member_action :upload, method: [:post] do
  result = { success: resource.images.attach(params[:file_upload]) }
  result[:url] = url_for(resource.images.last) if result[:success]
  render json: result
end
# Form field
unless object.new_record?
  plugin_opts = { image_uploader: { server_url: upload_admin_post_path(object.id), field_name: 'file_upload' } }
  f.input :description, as: :quill_editor, input_html: { data: { plugins: plugin_opts } }
end
For the relevant files of the upload example see here. Consider that this is just a basic example: images are uploaded as soon as they are attached to the editor (regardless of the form submit), it shows the editor only for an existing record (because of the upload_admin_post_path) and it doesn't provide a way to remove images (just deleting them from the editor will not destroy them, you'll need to implement a purge logic for that).

https://github.com/blocknotes/activeadmin_quill_editor
* ...
