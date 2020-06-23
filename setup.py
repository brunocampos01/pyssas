import os
from setuptools import setup


HERE = os.path.abspath(os.path.dirname(__file__))

# The text of the README file
with open(os.path.join(HERE, "README.md")) as f:
    README = f.read()


setup(name='pyssas',
      version='0.1',
      description='',
      long_description=README,
      long_description_content_type="text/markdown",
      url='https://github.com/brunocampos01/sql-server-analysis-services-features-extension',
      author='Bruno Campos',
      author_email="brunocampos01@gmail.com",
      license='MIT',
      platforms='any',
      classifiers=[
          'Environment :: Terminal',
          'Programming Language :: Python',
          'Development Status :: 4 - Beta',
          'Natural Language :: English',
          'Intended Audience :: Developers, Data Engineers, Data Scientists',
          'License :: MIT',
          'Topic :: Software Development :: Libraries :: Python Modules'
          ],
      packages=["pyssas"],
      entry_points={
          "console_scripts": ["pyssas=pyssas.__main__:main"]
      },
      zip_safe=False)
