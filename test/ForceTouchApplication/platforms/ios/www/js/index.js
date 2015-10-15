/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

var app = {
    // Application Constructor
    initialize: function() {
        this.bindEvents();
    },
    // Bind Event Listeners
    //
    // Bind any events that are required on startup. Common events are:
    // 'load', 'deviceready', 'offline', and 'online'.
    bindEvents: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    // deviceready Event Handler
    //
    // The scope of 'this' is the event. In order to call the 'receivedEvent'
    // function, we must explicitly call 'app.receivedEvent(...);'
    onDeviceReady: function() {
        app.receivedEvent('deviceready');

        // on touch start cordova core asks to iOS for ForceTouchData
        document.body.addEventListener('touchstart', function(e)
        {
          e.preventDefault();
          ForceTouch.getForceTouchData(function (ForceTouchData)
          {
            var forceTouchCapability = '';
            switch(ForceTouchData.forceTouchCapability)
            {
              case '0':
                forceTouchCapability += 'Unknown';
              break;
              case '1':
                forceTouchCapability += 'Unavailable';
              break;
              case '2':
                forceTouchCapability += 'Available';
              break;
            }
            // setting output values
            document.getElementById('forceTouchCapability').innerHTML = forceTouchCapability;
            document.getElementById('tapCount').innerHTML = ForceTouchData.tapCount;
            document.getElementById('timestamp').innerHTML = ForceTouchData.timestamp;
            document.getElementById('phase').innerHTML = ForceTouchData.phase;
            document.getElementById('force').innerHTML = ForceTouchData.force;
            document.getElementById('maximumPossibleForce').innerHTML = ForceTouchData.maximumPossibleForce;
            // check if ForceTouch or StandardTouch
            if(parseFloat(ForceTouchData.force) > 0.0)
              document.getElementById('touchType').innerHTML = 'Force Touch';
            else
              document.getElementById('touchType').innerHTML = 'Standard Touch';
          });
        }, false);

        // on touch values are set to original state
        document.body.addEventListener('touchend', function(e)
        {
          e.preventDefault();
          // restore output values
          document.getElementById('forceTouchCapability').innerHTML = '-';
          document.getElementById('tapCount').innerHTML = '-';
          document.getElementById('timestamp').innerHTML = '-';
          document.getElementById('phase').innerHTML = '-';
          document.getElementById('force').innerHTML = '-';
          document.getElementById('maximumPossibleForce').innerHTML = '-';
          document.getElementById('touchType').innerHTML = '-';
        }, false);
    },
    // Update DOM on a Received Event
    receivedEvent: function(id) {
        var parentElement = document.getElementById(id);
        var listeningElement = parentElement.querySelector('.listening');
        var receivedElement = parentElement.querySelector('.received');

        listeningElement.setAttribute('style', 'display:none;');
        receivedElement.setAttribute('style', 'display:block;');

        console.log('Received Event: ' + id);
    }
};

app.initialize();
