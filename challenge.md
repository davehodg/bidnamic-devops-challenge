<img src="logo.png" alt="drawing" width="500"/>

## DevOps / SRE Challenge

Here is a minimal flask app:

```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def pretend():
    return 'Lets pretend this function eats lots of resources!'
```

### Tasks 
1. Deploy this flask app to AWS using Terraform.


2. Consider the  following through your code or your README. 
Nothing to extensive...just so we have some talking points moving forward:

    ```text
    - Packaging
    - Deployment
    - Security
    - Monitoring
    - Scaling
    - Troubleshooting
    ```

3. Write a simple Makefile to run:
   ```text
    - Python Formatter [I hear Black is nice ;-)]
    - Python Linter
    ```

### Submission

Please fork this repo to complete the challenge.

Good luck we are rooting for you, show us what you can do!
