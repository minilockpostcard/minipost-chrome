bundle: bundle/chrome.app.background.js bundle/window.html

bundle/chrome.app.background.js: chrome.app.background.coffee
	coffee --print --compile chrome.app.background.coffee > bundle/chrome.app.background.js

bundle/window.html: minipost bundle/miniLockLib.js bundle/minipost.js bundle/certificates bundle/examples
	ditto minipost/index.html bundle/window.html

bundle/miniLockLib.js: minipost
	ditto minipost/miniLockLib.js bundle/miniLockLib.js

bundle/minipost.js: minipost
	ditto minipost/minipost.js bundle/minipost.js

bundle/certificates: minipost
	ditto minipost/certificates bundle/certificates

bundle/examples: minipost
	ditto minipost/examples bundle/examples

minipost:
	git clone git@github.com:minipostlink/minipost.git
	cd minipost; git reset --hard origin/deploy;

clean:
	rm -rf minipost
	rm -f bundle/*.html
	rm -f bundle/*.js
