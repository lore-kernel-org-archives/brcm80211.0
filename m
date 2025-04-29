Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E296826FD8D
	for <brcm80211@lists.linux.dev>; Tue, 29 Apr 2025 04:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745899889; cv=none; b=q7wLjQgYi3ugFJ7nT4CyOvOLL1T5DXch6XSstk91JBUXhVOduQgLkl4Oq5gXvE8s11sY6yoavyFcdmZkVHHVNtmkSBsoMj9EgNY0fuHSWwznOrwmm9D2gjwm0mH9Hjql1lETOJFCsW16/pbW7RjC+bC6lNR0BoRzDB4/O43CbiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745899889; c=relaxed/simple;
	bh=RSSynyWWMiNmVmAxe+aYQd6sf6S8adtU+PQHobclZBI=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ktnohSdsb5IAXRBpCQsBZTw/ww0xRUdw7nlTyUlrR2SPqBlO1gb2XcDs3CoFHRRJp1ksdeFebdxhcftgD5/A53x+diu2bsPNGjwbwGkF5jgY4KIyB8yOKf+SgxQYtRo7qvZEUDp+traV1nnwgWdOj+V98hi/2pgun37qYsqrTL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=AKxr5vn9; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="AKxr5vn9"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-af590aea813so6262623a12.0
        for <brcm80211@lists.linux.dev>; Mon, 28 Apr 2025 21:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745899887; x=1746504687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ynm6W9cGIXy5C+YgiimjZOzxKsvvcgCSl195aNNDZeU=;
        b=AKxr5vn9ShTXtUFrZkXOCxJrMPZVlJTQjsGEz9cyoAisPSq3jJkv0QofspktvkuKEP
         FFWLNw3zohfkH+in1CMIi6XG5MbSRg6ztFA0o+Zug4I6bXCmu74WxVJgytxr26NwEqqQ
         Cxxtm2U6hy/q1+FSTkqRZj4I5cGhqT49iuIzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745899887; x=1746504687;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ynm6W9cGIXy5C+YgiimjZOzxKsvvcgCSl195aNNDZeU=;
        b=Ou98udmm99sVwrglhT0vInQzSQMznMvoqD/5UFbT1PStiZlq8gN6r7NCEUZczrgGYP
         fAGpVLacZZ2GXIQ1TLJVf/ED5XnPA8lgZG0qEvEHIzNL9YthLb+Qz1ZxBGzsauFvni70
         xqN5o2uN3fGzQz+ycTAnA7uZKOPG8VK474yNUA+V/ZpXC2at3Gk4rx7Qjseb4zISkcSM
         dFhd62iatmeNvt7yMzbyQwEEWb6Beo9vVRud0nPOagAAiZ4UXkjX7by32K1nHtM/+mAP
         iB13/+JzJ8lZt024SDN6S6ULW3irmxtdIYkchNVoi7kOkVlpA7ftakfwfrWHJpr4Nm8K
         W6bw==
X-Forwarded-Encrypted: i=1; AJvYcCWr7KHSaejRkmn/D756dnH+T230zkNnzyuhF4uXt9CToIdhFKgMdumtLQ4anDrskPoulclSH+DIPX8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwakGktrV7YEitR5+ApTvfnt0P9Qhir+99Y/NSc+7nMez78Ffw/
	FTDwiyvTvO0DMpe7C/niHZ33k/nOLfsniEheodCnB8SsEUPGtzOog2f6cyBqsw==
X-Gm-Gg: ASbGncv/vYkxUhTcsV6GqPoBibUrcUu/0rwWTos3z7f5CgSa7SwlaYwLGP5imR1cD7R
	cs9n6FZ46VP9AC5umV5lLqQXV7MOCRWwynKpkA9a4V0DOxKMLNEEgUVTgMDSaYDz8lzlBZaFmyL
	P6MMigndQ08uWTJuYHTAjORtCM5swNvomowNw56u7olDqLPLyfWTqY19yzEUiKX4mlPBtweUv5j
	C0daoAvN1hQvRx/afJ53TVkq9/i02LaPxlV0ST+hfT0DAAZwLSUsJz5Y7t1nD1FmXT539VpGKKO
	1yH5DjXYamaNaRnHh9adysmjcALxu5EuxFZgGjWCBeDWTAT/CxboaWAHGjuvFsM95qvhRzoc3R/
	QjNc=
X-Google-Smtp-Source: AGHT+IG5u3vXBuCkg8GMcC9HLoKtgr2C4q32Czlilr9TM9eBzvO7g51fTxjxXyTALleWEBLEsjtU6Q==
X-Received: by 2002:a17:902:f551:b0:223:517a:d4ed with SMTP id d9443c01a7336-22de6c1c4e4mr23174255ad.15.1745899887053;
        Mon, 28 Apr 2025 21:11:27 -0700 (PDT)
Received: from [10.229.22.119] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dc60bd15fsm59826065ad.15.2025.04.28.21.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 21:11:26 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Peter Robinson <pbrobinson@gmail.com>
CC: Johannes Berg <johannes@sipsolutions.net>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>
Date: Tue, 29 Apr 2025 06:11:16 +0200
Message-ID: <1967fbdeea0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <CALeDE9MGXiSN=8E+T_ZGOLHsk8DB4iL=hV7ircqqb9=q1xTUYw@mail.gmail.com>
References: <20250425085519.492267-1-arend.vanspriel@broadcom.com>
 <CALeDE9MGXiSN=8E+T_ZGOLHsk8DB4iL=hV7ircqqb9=q1xTUYw@mail.gmail.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH wireless-next v3 0/4] wifi: brcmfmac: external auth support for Infineon devices
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On April 28, 2025 4:52:48 PM Peter Robinson <pbrobinson@gmail.com> wrote:

> Hi Arend,
>
>> The Infineon chips support external authentication in station mode when
>> firmware advertises it. The feature that must be present in firmware is
>> sae_ext. This has been ported from Infineon repository and makes use of
>> the per-vendor framework. It showcases how things can be organized per
>> vendor to provide the functionality.
>>
>> Unfortunately, I have no Infineon device and firmware that makes use of
>> external auth. This series was submitted earlier as RFT and it was tested
>> successfully by James Prestwood with iwd after adding a fourth patch to
>> the series. I would not mind if more testing is done with this series
>> like using wpa_supplicant instead of iwd.
>
> So I tried testing this on a RPi4 with the upstream linux-firmware
> repo, both on Fedora 42 using NetworkManager on top of iwd or
> wpa_supplicant.
>
> Now I think this has  the right firmware but TBH I am not 100% sure
> but I get the following listed in the "Supported extended features"
> section when I run 'iw phy phy0 info':
> * [ SAE_OFFLOAD ]: SAE offload support
> * [ SAE_OFFLOAD_AP ]: AP mode SAE authentication offload support
>
> For reference the firmware version is:
> brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/6 wl0: Apr 15 2021
> 03:03:20 version 7.45.234 (4ca95bb CY) FWID 01-996384e2
>
> When I was testing with iwd 3.6 it was actually not repporting WPA3 as
> an option against my SSIDs, just WPA2 where with wpa_supplicant 2.11
> it reports both.
>
> With NM+iwd in use I get an error and nothing happens, if I set sae
> for NM+wpa_supplicant I get a lot of the following in the kernel log
> and the connection fails:
> [ 1141.846900] brcmfmac: brcmf_set_channel: set chanspec 0xd022 fail, 
> reason -52
> [ 1141.962815] brcmfmac: brcmf_set_channel: set chanspec 0xd026 fail, 
> reason -52
> [ 1142.074828] brcmfmac: brcmf_set_channel: set chanspec 0xd02a fail, 
> reason -52
>
> I will try and find a couple of other devices with an appropriate
> cypress/infineon.

Thanks for giving the patches a spin. The firmware should have a feature 
named sae_ext. I think the one you with iw are indicating same support in 
general.

You can check the firmware features in debugfs under 
<mount>/ieee80211/phyX/fwcap.

Regards,
Arend
>
>
>> Arend van Spriel (3):
>> wifi: brcmfmac: support per-vendor cfg80211 callbacks and firmware
>> events
>> wifi: brcmfmac: make per-vendor event map const
>> wifi: brcmfmac: cyw: support external SAE authentication in station
>> de
>>
>> Ting-Ying Li (1):
>> wifi: brcmfmac: Fix structure size for WPA3 external SAE
>>
>> .../broadcom/brcm80211/brcmfmac/cfg80211.c    |  44 ++-
>> .../broadcom/brcm80211/brcmfmac/cfg80211.h    |  25 ++
>> .../broadcom/brcm80211/brcmfmac/common.c      |   1 +
>> .../broadcom/brcm80211/brcmfmac/core.c        |   2 +
>> .../broadcom/brcm80211/brcmfmac/cyw/core.c    | 308 ++++++++++++++++++
>> .../brcm80211/brcmfmac/cyw/fwil_types.h       |  87 +++++
>> .../broadcom/brcm80211/brcmfmac/feature.c     |   3 +-
>> .../broadcom/brcm80211/brcmfmac/feature.h     |   4 +-
>> .../broadcom/brcm80211/brcmfmac/fweh.c        |   7 +-
>> .../broadcom/brcm80211/brcmfmac/fweh.h        |   8 +-
>> .../broadcom/brcm80211/brcmfmac/fwvid.h       |  29 ++
>> 11 files changed, 495 insertions(+), 23 deletions(-)
>> create mode 100644 
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
>>
>>
>> base-commit: f600832794c91d7021d7337104734246b02a2b86
>> --
>> 2.43.5



