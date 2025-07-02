Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD11C19DF62
	for <brcm80211@lists.linux.dev>; Wed,  2 Jul 2025 02:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751424742; cv=none; b=Ssmh1Rgchx/XohWefpNa3oaq14azwtQHKmHRpWMUeBJF4c+5Skv4RC0n85B8kuWnjExMKTl1vnRTE9M5D0Ttnz+ymVU8fYd1lECrTHNdEty42Cn5dTijaThY4jcJCrvkO5BgSgMfz2nnwx4U15Sxj9EQM0wvLCYGYOX9IUCXh2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751424742; c=relaxed/simple;
	bh=G4ERL0+D1jaQ17f3/35QJx6RGMr53J8NyLHauQ60aWg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Zova2RgDTENWwC3px3Tfi/urS7MfcwnTPtujCC7nBM5Jg61paFQAkixW2gg2c+2kIYqnny0E5h5c2Gav1HMrwG7P/E5Kv0tKa5sEPqIpNqDED67tH9Ru2FMsyI6koA5GO3xbHLvJJL1iN2fW0+qneyMqmD3Dky4BNHBp5vN19J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IigwHgA+; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IigwHgA+"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e87c86845d9so2377140276.1
        for <brcm80211@lists.linux.dev>; Tue, 01 Jul 2025 19:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751424739; x=1752029539; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G4ERL0+D1jaQ17f3/35QJx6RGMr53J8NyLHauQ60aWg=;
        b=IigwHgA+ZQeWLQAYoxJRpfZ4hvTPGHrVJn4iGrTmgzAxJau6Vpfh+HcWutzhwPfEGE
         2nUJlYep4J1X9Q59E4s2tUcqj3wfOprrKnWpDDJFXpGAsByQsX8P/2MUkNCoZDQGNssE
         Ii6R/HWowAZaP3+tNu2JsA21ZLRTDKZvU50ZQZaBJ47Y0NMllnKrRuH3ZmM/mkhvtqFW
         o+c/SspEz9mn2DmxkaVFl7XBT3QyAFK8H6uiCizVwN2lTEBC/dcomFSv/bdYkfaG0oHT
         dQ1sgczMinVyIj90Wq5GRJZPzjoJm0e7e5Fw/kfBk0Vtr/vrnAKWWmTqFhoG6AzbPyU4
         ro0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751424739; x=1752029539;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G4ERL0+D1jaQ17f3/35QJx6RGMr53J8NyLHauQ60aWg=;
        b=tBHElIi7zH2LneyFnN6+iLsIpg/gdrOkge36Ctg+LFrDUiYLFWtchhiFKn4Hzu8zkm
         Tx6uQXY+oX+2QszY/2mLu3HaBydD4I/vfV8rp7XRW9eqkpZbpEtojPSaQ/mJS2g44513
         M6Z8FMOrOSdyNbFVWrksmjBUDhsSKA9dT+fshNqHFgBi96ZCFnMvsJYD0VbRFruH+bsY
         CR2/K5K/gXIDsAEpHkCkkyZbUH4hsEZfo290SR/XaGPdGKtNS4hvv4GmaWHin3VppdFv
         kFenoxyEArNhDuU2iR9mI0dYHcV+1qV6X9CK7X1x0snpnTkBEXHkXaPYmQjZM91KmjHe
         qqUw==
X-Forwarded-Encrypted: i=1; AJvYcCUaIouwrlCVvP2QddIUL0MiwptoVvia4S9L9smNyZUPArifVZuKfvOLTi3wj5xwAP43cbfx7LaUzX4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTeJGmnOd2McBDu++ceFs6s1sb8t+uUShXc2a2JTADYtUQYGF8
	gQb5tDcc8RE53oIrRQZkxvxtv8t2iJqHOpqSmmVz7IqUDBow3tdpg7FE7eVtE/4pGeWt6aOrtRs
	aCmNrdVnhtPbgXiXTwJVbjjfs2aBEEUA=
X-Gm-Gg: ASbGncuKnAiBk6kaaQAsSpIjbrtn+KFTNDLe9TB0pXNfzdmxsKMNR8uJQwDk2x4xaDL
	TkXh6QB/AydE1zAkwLqlqruTnOFgk/qclYUh8PuKGjtkrSHcOK1lX7heOKltpCq/2cXgR+QWdD9
	ufUz5YF1NcrQZANmFEYi+Uw5KwvKrBfPWKVwOrlEMti0benpAI9+hChH8=
X-Google-Smtp-Source: AGHT+IE1CAl9s3T6XYLeg5rNyggiWbmMZPMGrcXq40hSXV+aIlFBMtLs3/SBRNLdtsGcqlQwiRjurFVOErAOVvyCsoM=
X-Received: by 2002:a05:690c:998d:b0:70e:18c0:dac5 with SMTP id
 00721157ae682-7164d3f1debmr15093277b3.10.1751424739660; Tue, 01 Jul 2025
 19:52:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: KeithG <ys3al35l@gmail.com>
Date: Tue, 1 Jul 2025 21:52:08 -0500
X-Gm-Features: Ac12FXzcajfW4ToO9YyYZBxRsMyHnjKZ_sFymR_YUAsE8SxJvAcYcJZfAGYeIyE
Message-ID: <CAG17S_MZsrzhKj5XtT1y3Z61h6uzi99RxkDLB=VPiwYs+c_g=g@mail.gmail.com>
Subject: wpa_supplicant floods log with scan error when ssid is not present
To: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com
Cc: Arend Van Spriel <arend.vanspriel@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

New to wpa_supplicant and wpa_cli and am using systemd-resolved as
network manager.

I have everything working reasonably well, but struggled with one
thing. I get this
error flooding the journal log:

Jul 01 13:26:10 pi4 wpa_supplicant[420]: wlan0: Failed to initiate sched scan
Jul 01 13:26:19 pi4 wpa_supplicant[420]: wlan0: Failed to initiate sched scan
Jul 01 13:26:28 pi4 wpa_supplicant[420]: wlan0: Failed to initiate sched scan

This occurs when there is a known ssid in the config, the ssid is
enabled by wpa_cli, but this ssid is not visible and the wlan is not
connected to any other ssid.

If I disable the network: 'wpa_cli disable network 0', it stops
spamming the log. If It stays enabled yet I connect to another ssid,
it does not spam the log. It is only when it is not connected and
there is an ssid in the config that it cannot 'see'.

It appears that when wpa_supplicant is complaining that it 'Failed to
initiate sched scan' it will immediately connect to that known network
when it reappears. As long as the ssid is not available, and is in the
list (in /etc/wpa_supplicant.conf) and 'enabled' by wpa_cli the log
gets spammed with this. It seems a bit strange that this would be an
unexpected situation: that wpa_supplicant may not be connected yet
have an ssid listed that may not be available.

I am running this on an RPi which is running RPiOS with systemd and
have tried this with wpa_supplicant.service (dbus version edited to
specify wlan0 so that it can save the configs) and with
wpa_supplicant@wlan0 (without dbus).

Any help appreciated.
