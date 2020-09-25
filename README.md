Merging of the three branches
 itsOWL-TeDZ_restPutNewAasAndAssetOnRestServer
 itsOWL-TeDZ_readAndWriteAASX
 itsOWL-TeDZ_replaceSubmodelAndSubmodelElement
from the GitLab-Repo
 https://gitlab.com/aorzelskiGL/aasxserver.git
in new branch
 itsOWL-TeDZ_restServerUpdates
in GitHub-Repo
 https://github.com/admin-shell-io/aasx-server

Implemented functionality of REST-server in itsOWL-TeDZ_restPutNewAasAndAssetOnRestServer:
-add/update AAS in REST-server by REST-PUT
--adapted the helper-function in [RestRoute(HttpMethod = HttpMethod.PUT, PathInfo = "^/aas(/|)$")] 
-add/update Asset in AAS-environment with AAS of specified AAS-IdShort by REST-PUT
--new [RestRoute(HttpMethod = HttpMethod.PUT, PathInfo = "^/aas/(id|([^/]+))/asset(/|)$")]

Implemented functionality of REST-server in itsOWL-TeDZ_readAndWriteAASX:
-load AAS-environment from AASX-file to REST-server while REST-server is allready operating
--adds/updates AAS-environment in REST-server
--request to load by REST-PUT
---new [RestRoute(HttpMethod = HttpMethod.PUT, PathInfo = "^/aasx/server(/|)$")]
---JSON-content: AASX-file-path
-save AAS-environment in AASX-file
--request to save by REST-PUT
---new [RestRoute(HttpMethod = HttpMethod.PUT, PathInfo = "^/aasx/filesystem/([^/]+)(/|)$")]
---JSON-content: AASX-file-path

Implemented functionality of REST-server in itsOWL-TeDZ_replaceSubmodelAndSubmodelElement:
-updated submodels and submodelElements are replaced so that their ordering does not change
(-before: existing submodels/submodelElements were removed and their update was added to the end of the collection)
--adapted helper-functions in 
---[RestRoute(HttpMethod = HttpMethod.PUT, PathInfo = "^/aas/(id|([^/]+))/submodels(/|)$")]
---[RestRoute(HttpMethod = HttpMethod.PUT, PathInfo = "^/aas/(id|([^/]+))/submodels/([^/]+)/elements(/([^/]+)){0,99}?(/|)$")]
