import os
from setuptools import find_packages  # get modules (pyssas) and submodules (cube_formatter, ...)
from setuptools import setup
try:  # for pip >= 10
    from pip._internal.req import parse_requirements
except ImportError:  # for pip <= 9.0.3
    from pip.req import parse_requirements


HERE = os.path.abspath(os.path.dirname(__file__))
requirements_path = os.path.join(HERE, 'requirements.txt')
install_reqs = parse_requirements(requirements_path, session=False)

try:
    requirements = [str(ir.req) for ir in install_reqs]
except:
    requirements = [str(ir.requirement) for ir in install_reqs]

# The text of the README file
with open(os.path.join(HERE, 'README.md')) as f:
    README = f.read()

setup(name='pyssas',
      version='0.1',
      packages=find_packages(),
      install_requires=requirements,
      entry_points={
          'console_scripts': ['pyssas=pyssas.__main__:main']
      },

      # metadata to display on PyPI
      description='SQL Server Analysis Services with Python',
      long_description=README,
      long_description_content_type='text/markdown',
      keywords='ssas microsoft olap',
      url='https://github.com/brunocampos01/pyssas',  # project home page
      author='Bruno Campos',
      author_email='brunocampos01@gmail.com',
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
      ]
      )
