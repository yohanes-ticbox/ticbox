<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="ticbox_main"/>
<title>Insert title here</title>
</head>
<body>
  <div class="body">
  
  <section id="forms">
  <!-- div class="page-header">
    <h1>Forms</h1>
  </div-->

  <div class="row">
    <div class="span8 offset2">
 

      <form class="form-horizontal well">
        <fieldset>
          <legend>Kami membutuhkan data demografik anda untuk menentukan survey apa yang sesuai dengan Anda. Data anda akan kami simpan hanya untuk keperluan kami.</legend>
          
          <div class="control-group">
            <label class="control-label" for="input01">User Name</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="input01">
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="input02">Email</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="input02">
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="input03">Password</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="input03">
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="input04">Password Confirm</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="input04">
            </div>
          </div>
          
          <div class="control-group">
            <label class="control-label" for="select01">Country</label>
            <div class="controls">
              <select id="select01">
                <option>Country</option>
                <option>Indonesia</option>
              </select>
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="select02">Province</label>
            <div class="controls">
              <select id="select02">
                <option>DKI Jakarta</option>
                <option>Jawa Barat</option>
                <option>Jawa Tengah</option>
                <option>Jawa Timur</option>
              </select>
            </div>
          </div>
		  <div class="control-group">
            <label class="control-label" for="select03">City</label>
            <div class="controls">
              <select id="select03">
                <option>DKI Jakarta</option>
              </select>
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="select04">Gender</label>
            <div class="controls">
              <select id="select04">
                <option>Male</option>
                <option>Female</option>
              </select>
            </div>
          </div>

          <div class="control-group">
            <label class="control-label" for="textarea">Textarea</label>
            <div class="controls">
              <textarea class="input-xlarge" id="textarea" rows="3"></textarea>
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="focusedInput">Focused input</label>
            <div class="controls">
              <input class="input-xlarge focused" id="focusedInput" type="text" value="This is focused…">
            </div>
          </div>
          <div class="control-group">
            <label class="control-label">Uneditable input</label>
            <div class="controls">
              <span class="input-xlarge uneditable-input">Some value here</span>
            </div>
          </div>
          
          <div class="form-actions">
            <button type="submit" class="btn btn-primary">Save changes</button>
            <button type="reset" class="btn">Cancel</button>
          </div>
        </fieldset>
      </form>
    </div>
  </div>

</section>
  
  </div>
</body>
</html>