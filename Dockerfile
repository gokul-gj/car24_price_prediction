##Base Image (contain part of os and python3.9)
FROM python:3.9-slim-buster

#Working Directory
WORKDIR /app 

# Avoid waring of outdated pip
RUN python3 -m pip install --upgrade pip

# copy requirement.txt and save in requirement.txt
COPY requirement.txt requirement.txt

# install requirements
RUN pip install -r requirement.txt

# copy all the file in the current path to image current path
COPY . .

#Run the strealit app
CMD streamlit run app.py

# in command promt use code to build docker image: docker build -t cars24_stream_lit_app .

# Command of seeing the image: docker image ls

# Command for putting image into a container to a specific port (8501 is the default stremalit port, 8000 is the specified port, -p is port mapping, -d detached mode): docker run -p 8000:8501 -d cars24_stream_lit_app

# Create a repository in dockerhub and push this repository to newly created repoditory for further deployment. Command for this can be found after creting the repository. 

    # command for image creation (the name must be the same)(same as before but with different name): docker build -t gokulgj/streamlit-cars24-app .
    # command to push(find in newly created repos): docker push gokulgj/streamlit-cars24-app:latest


