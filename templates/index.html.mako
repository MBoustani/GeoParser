<!DOCTYPE html>
<html>
<head>
<title>Memex GeoParser</title>

<script src="${staticRoot}/js/geo.ext.min.js" charset="UTF-8" type="text/javascript"></script>
<script src="${staticRoot}/js/geo.js" type="text/javascript"></script>
<script src="${staticRoot}/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="${staticRoot}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${staticRoot}/js/dropzone.js" type="text/javascript"></script>

<!--App Specific Custom JS -->
<script src="${staticRoot}/js/app.js" type="text/javascript"></script>


<link href="${staticRoot}/css/dropzone.css" rel="stylesheet" />
<link href="${staticRoot}/css/bootstrap.css" rel="stylesheet" />
<link href="${staticRoot}/css/bootstrap-glyphicons.css" rel="stylesheet" />

<!--App Specific CSS -->
<link href="${staticRoot}/css/style.css" rel="stylesheet" />

<link rel="icon" type="image/png" href="/static/img/favicon-map-marker.ico">

</head>
<body>
  <nav class="navbar navbar-inverse navbar-static-top">
    <div class="navbar-header"></div>
    <a class="navbar-brand" href="#">Memex GeoParser</a>
  </nav>
  <div id="map">
    <div class="row">
      <div class="top-left-input-box input-box-bg col-md-4 bottom-buffer top-buffer mar-def">
        <!-- Nav icons start -->
        <div class="row">
          <div class="col-md-7"></div>
          <div class="col-md-5 bottom-buffer">
            <div class="btn-group btn-group-lg" id="navButtons" data-toggle="buttons">
              <!-- BELOW HEIRARCHY OF label MUST BE MAINTAINED -->
              <label class="btn btn-default"> <input type="radio" name="options"
                id="navAddIndex" autocomplete="off"> <span class="glyphicon glyphicon-cog"
                aria-hidden="true"></span>
              </label> <label class="btn btn-default active"> <input type="radio" name="options"
                id="navUploadFiles" autocomplete="off"> <span
                class="glyphicon glyphicon-cloud-upload" aria-hidden="true"></span>
              </label> <label class="btn btn-default"> <input type="radio" name="options"
                id="navSearchIndex" autocomplete="off"> <span
                class="glyphicon glyphicon-search" aria-hidden="true"></span>
              </label>
            </div>
          </div>
        </div>
        <!-- Nav icons end -->
        <div class="clear"></div>
        <!-- User Input Box Start-->
        <div>
          <!-- BELOW HEIRARCHY OF div{fileUploadBox,addIndexBox,searchIndexBox} MUST BE MAINTAINED else toggle switch will fail-->
          <!-- File Upload box Start-->
          <div id="fileUploadBox">
            <div class="row">
              <div class="col-md-1"></div>
              <div class="col-md-10 no-left-padding ">
                <h4>Upload Files</h4>
                <hr />
              </div>
              <div class="col-md-1"></div>
            </div>
            <div class="clear"></div>

            <div class="row">
              <div class="col-md-4"></div>
              <div class="col-md-4 bottom-buffer">
                <span class="glyphicon glyphicon-cloud-upload extra-large" aria-hidden="true"></span><br />
              </div>
              <div class="col-md-4"></div>
            </div>
            <div class="clear"></div>

            <!-- DROPZONE START -->
            <div id="actions" class="row">

              <div class="col-lg-8">
                <!-- The fileinput-button span is used to style the file input field as button -->
                <span class="btn btn-success fileinput-button dz-clickable"> <i
                  class="glyphicon glyphicon-plus"></i> <span>Add files...</span>
                </span>
                <button type="reset" class="btn btn-warning cancel">
                  <i class="glyphicon glyphicon-ban-circle"></i> <span>Cancel upload</span>
                </button>
              </div>

              <div class="col-lg-4">
                <!-- The global file processing state -->
                <span class="fileupload-process">
                  <div id="total-progress" class="progress progress-striped active"
                    role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                    <div class="progress-bar progress-bar-success" style="width: 0%;"
                      data-dz-uploadprogress=""></div>
                  </div>
                </span>
              </div>

            </div>
            <div class="clear"></div>

            <div class="row">
              <div class="col-md-12 bottom-buffer no-right-padding">
                <div class="table table-striped" class="files" id="previews">

                  <div id="template" class="file-row">
                    <div class="clear"></div>
                    <div class="row">
                      <!-- This is used as the file preview template -->
                      <!-- <div> we don't need thumb nail view
									<span class="preview"><img data-dz-thumbnail /></span>
									</div> -->

                      <div class="col-md-4 no-right-padding">
                        <span class="name" data-dz-name></span> <br /> <span class="size"
                          data-dz-size></span>
                      </div>
                      <div class="col-md-3 no-right-padding">
                        <strong class="error text-danger" data-dz-errormessage></strong>
                        <div class="progress progress-striped active" role="progressbar"
                          aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                          <div class="progress-bar progress-bar-success" style="width: 0%;"
                            data-dz-uploadprogress></div>
                        </div>
                      </div>
                      <div class="col-md-5 no-right-padding">
                        <button data-dz-remove class="btn btn-warning cancel">
                          <i class="glyphicon glyphicon-ban-circle"></i> <span>Cancel</span>
                        </button>
                        <button data-dz-remove class="btn btn-danger delete">
                          <i class="glyphicon glyphicon-trash"></i> <span>Delete</span>
                        </button>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
            </div>
            <!-- DROPZONE END -->

            <div class="clear"></div>

          </div>
          <!-- File Upload box End-->
          <!-- Add Index Box start-->
          <div id="addIndexBox" class="hide">
            <div class="row">
              <div class="col-md-1"></div>
              <div class="col-md-10 no-left-padding  bottom-buffer">
                <h4>Start Search</h4>
                <hr />
              </div>
              <div class="col-md-1"></div>
            </div>

            <div class="clear"></div>

            <div class="row">
              <div class="col-md-1"></div>
              <div class="col-md-10 no-left-padding  bottom-buffer">
                <h4>Search Database</h4>

                <input type="text" class="form-control" placeholder="Type link to index.."
                  aria-describedby="sizing-addon1">
              </div>
              <div class="col-md-1"></div>
            </div>

            <div class="clear"></div>

            <div class="row">
              <div class="col-md-1"></div>
              <div class="col-md-10 no-left-padding  bottom-buffer">

                <div class="dropdown">
                  <button class="btn btn-default dropdown-toggle dropdown-toggle-full-width" type="button" id="dropdownMenu1"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    Choose from Saved Collection <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu dropdown-menu-full-width" aria-labelledby="dropdownMenu1">
                    <li><a href="#">Weapons Data</a></li>
                    <li><a href="#">Human Trafficking data</a></li>
                  </ul>
                </div>

              </div>
              <div class="col-md-1"></div>
            </div>

            <div class="clear"></div>
            <div class="row">
              <div class="col-md-9"></div>
              <div class="col-md-3">
                <button type="button" class="btn btn-primary">Save Search</button>
              </div>
            </div>
          </div>
          <!-- Add Index Box end-->
          <!-- Search Index Box start-->
          <div id="searchIndexBox" class="hide">
            <div class="row">
              <div class="col-md-1"></div>
              <div class="col-md-10 no-left-padding ">
                <p class="input-group">
                  <span class="input-group-addon"><span
                    class="glyphicon glyphicon-map-marker"></span></span> <input type="text"
                    class="form-control search-input" placeholder="Search by keyword or location.." />
                  <span class="input-group-addon search-icon"> <span
                    class="glyphicon glyphicon-search" aria-hidden="true"></span>
                  </span>
                </p>
              </div>
              <div class="col-md-1"></div>
            </div>
          </div>
          <!-- Search Index Box end-->
        </div>
        <!-- User Input Box End-->
        <div class="clear"></div>
        <ul id="uploadedFiles"></ul>

      </div>
    </div>
  </div>

</body>

</html>
