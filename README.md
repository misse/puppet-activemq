# misse-activemq

## Overview
This is a simple puppet module for deploying an Apache ActiveMQ server

### Basic usage
Get the module to your modules/ subdirectory.

Then add this to a manifest:

    class { 'java':
      distribution => 'jre',
    } ->
    class { 'activemq':
      version => '5.8.0',
      user    => 'activemq',
      group   => 'activemq',
      home    => '/usr/share',
      console => true,
    }

You can also install activemq from a yum repo

    class { 'java':
      distribution => 'jre',
    } ->
    class { 'epel': } ->
    
    yumrepo { 'puppetlabs-deps':
      descr    => 'Puppet Labs Dependencies El 6 - $basearch',
      baseurl  => 'http://yum.puppetlabs.com/el/6/dependencies/$basearch',
      gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
      enabled  => 1,
      gpgcheck => 1,
    } ->
    
    class { 'activemq':
      package_type => 'rpm',
    }
    class { 'activemq::stomp': }


### Enabling STOMP connector

    class { 'activemq::stomp':
      port => 61613,
    }
# Related work
  This is a fork of maestrodev/activemq v2.0.3 to add more configurability to activemq.

# License

    Copyright 2012-2014 MaestroDev
    
    Copyright 2016	Misse

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
