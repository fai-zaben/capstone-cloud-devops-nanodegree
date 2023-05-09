setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	python3 -m venv ~/.udacity_capstone
	source ~/.udacity_capstone/bin/activate
	
install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
	    pip install -r requirements.txt
	wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64
	chmod +x /bin/hadolint

lint:
	# This is linter for Dockerfiles
	hadolint Dockerfile

	# This is a linter for Python source code 
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202 app.py
	
run-app:
	python3 app.py
	
build-docker:
	docker build -t flask-app .

run-docker: 
	docker run -d -p 80:80 --name flask-app flask-app
	
upload-docker: 
	./upload_docker.sh