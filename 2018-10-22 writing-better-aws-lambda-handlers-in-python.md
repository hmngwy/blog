# Writing Better Python AWS Lambda Handlers

Most AWS Lambda Python handlers look like this:

```python
def handlers(event, context):
    return "ok"
```

Pretty simple, it gets the message across. But if you write your whole application like this, you will soon find yourself breaking out functions into little helpers that you import into your handler modules. 

You may end up with a directory structure like this:

```
- handler.py
- login.py
- utils/handler_helper.py
- utils/login_helper.py
```

This will get exhausting real fast. If you have helpers that can only be used in one handler it feels excessive to break it out into a separate file, but it feels strange keeping it inside the handler module root when it's not one. 

You can work around this project organization conundrum using Python callables:

```
class MyHandler():

    def __init__():
				pass
    
    @staticmethod
    def __my_helper():
        return "helped!"
        
    def __call__(event, context):
        return self.__my_helper()
             
handler = MyHandler()
```

AWS Lambda will then call the variable `handler`, like so `handler(event, context)`. Your helper function, now a method now indicates a stronger relationship with the handler.

I've created a package that makes it easier to create handlers for specific AWS Lambda triggers.

```python
pip install aws-lambda-handler
```

To use it simply inherit from the BaseHandler.

```
import aws_lambda

class EchoHandler(aws_lambda.Handler):
    """Echo handler."""

    def perform(self, request, **k):
        """Echo perform method."""
        response = aws_lambda.Response()
        response.body = self.request.event
        return response

echo_handler = EchoHandler()
```

It wraps the event and context arguments into a Request object, and your handler should return a Response object. 

This lets you create middleware that manages the trigger's request arguments, and your response as you please, removing that data wrangling task from the handler and making everything much more reusable. 

Right now it only provides the Base and the API Gateway handlers. I plan to add more soon, pull requests are also appreciated.

tags: aws serverless python
