Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794167734;
	b=mcHKq9mREzYNoCuJHBZA/Ae/I8aV7qNv9QArbw03ewcp4zZbTSOmiEAPCQEhHo+Y8Nj2
	 j1QSA0ROCTnf1CZchSyY33PnoYhen9AvecUQczAzFJM1ga5/jzt0hZxMJhDzOSOpGgXjc
	 Eb1LRgUa/xb8XiuvJcA8j3dJFgavPILF+cdIn53bq42QUtTuguFDhBqZZ9bYuhPYS0oPH
	 Wdz8smaVpFQxJ/eWZYl2jA76aiQwtg9OCaAeCDCWYmAopUQBBkh7JVQB4wJJ1Pdk7Tnlg
	 4TUNJqBVbhMyT7MDsFxu8I0VZ3J2Xnv2OKVhXQaL3Vyjh0vEEDM3FaBSwsyEScXhrWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794167734;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ljpPnIJB5gvEueSlqHLmqJGlOso//lAKmsQSBJB5C1Q=;
	b=nCgMI92brFucv31VhtMh02MEqDSi8dDtYT3j65rM5nzTnMsCt4N7HDqVTJJYT9I5U31a
	 Dg96q03xvz0HqqWUvqFc9it5/lDEXgEWdrjv14jruuXnMCe3xpXldN+5GvM4rO3LXaSGU
	 TT+R7eMPall6CztZEUjBYwbWYZA93cx0Vh3GSCjz0e9+dnWspQGngWn1xPkMscJFoJfio
	 p393RcIb/2v5P6wJAxNmm5d2K0C8D3jpaYXPyFt/wALSXfu5WbnCyNNu75bZXzmi2i9uB
	 s7Vw3a1LLFXE+LCsUdSeHkp1MFwj3TSlPZEKx2gaPzoTZ0SyQVxrz18GqO6N/jBOb8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OwBcV0LN;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A90606A31C
	for <brcm80211@lists.linux.dev>; Sun,  8 Nov 2026 19:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6A90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OwBcV0LN
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so107017a91.3
        for <brcm80211@lists.linux.dev>; Sun, 08 Nov 2026 11:55:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794167733; x=1794772533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ljpPnIJB5gvEueSlqHLmqJGlOso//lAKmsQSBJB5C1Q=;
        b=fZg+DfqU7xDU6vx597/mpVIgMffupK8wVVzpg9yIr0RHdpwM2LerJgCTNCuSfD2OmD
         7zOZBSCi+puKQz8KDGJr6OwT2OZXuTKb8t6RQTgNofOglrF/8rsBxipKg20sLyS+cC/e
         qWvT0clEjmIoZQM6y6h9UlviK/fCRTolx45dC5cyfkLauU62wMy/hihMmoW1yuHgGUsG
         xLlWQy5Y/FK64SQww5/ZP8FBEa6H4Uapkyrq5QZt3oKdin4ede4GFOyOAzqb/f4bNPvp
         IXFbzmPkTzX+aaIVqIENcSgv1qpoQvOZJOSugGxz9p5vhTQX3gYYcMdPHkq9pxoXZlRC
         aOMw==
X-Forwarded-Encrypted: i=1; AL+hErEU08admL1lyrSMcuu5Chs7mbwf5vVvD5OjegGbDW2jDvaWgXnUuH+PGlDNbHQblPg23xWpeOZDwqI=@lists.linux.dev
X-Gm-Message-State: APuU4Z+vC1mplIj0tUGTKpWIIW934FDW8OsWPMW1ffG51iOewwkvcCaW
	DAc0jOIlIbYxYlt0mI80qsQuKCnUNerNQ1G/m8FtuWV/PiVn99ruPGjmLRymuoZmJBwN8dy9p94
	gIxa6dT112v/VfATksTzr8E0dn9mMhGKlL8nrZfRtMIa7Ug2orznE0HL4wAvRN4aBIGGecMs/5H
	Tp4kXmUesyO10rSrVgh9kuJO0NwDRIOofE2/JebcnCgqXns7qKBSTp2sneLAt5Ru9HS5/+lFEam
	SRWps19c5kbxBmuFaYebA==
X-Gm-Gg: AYBFou3y+uc+f2CF8ghUmFePaIw7r5Ev2WyPhBTcJv4omygZQDCdIBenpENeq9FSeiM
	vGXT1DYqbEIBZJr8dNprRz7ya/NRBtkY5f31V0aKJLaXR6aOC1DDFv6ecsY4203bS69YPwYLRHI
	dpTEyd+miSashDo5/0uTN86x/d5lCYHCSZXKWnFsFRbm+b9zlmxN5l1CQl+O2U8CU3uG1YJmuXD
	JuWOXI8R+tTAfkIdjO6VMZe5RRmuD0tEPwZ6L1guVUqDcoOQP9mvNBs91z1Pu344T3lrryruXXD
	nVganLYwajvcThM/DjNHPNAtTPHlj9aXaquuKvDqzmg9zfsmaU+JW7cN24I3QcMHsQP6E3D0JIH
	PNVdJOFabQ+8xoIKRKFBy1UbMhJi6djUGqUF30gXk5ECMlaCHl3H+yBJHlc+1u+WbFOQ6p5V8yn
	SVg38htbIcSXwp0xAlNPpEQB80uovAjShEKXifkA8=
X-Received: by 2002:a17:90b:55cf:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3b12d3210ccmr1440121a91.20.1794167732931;
        Sun, 08 Nov 2026 11:55:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b101d2e067sm2344703a91.5.2026.11.08.11.55.32
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 11:55:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c4d58203e40so16773966b.1
        for <brcm80211@lists.linux.dev>; Sun, 08 Nov 2026 11:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794167731; x=1794772531; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ljpPnIJB5gvEueSlqHLmqJGlOso//lAKmsQSBJB5C1Q=;
        b=OwBcV0LN2DWdU/IZ0qZMzTiit1C4y3D9mfocuiPH100c0XFTlwp4I8KZGiNTqS5WMN
         0n8vIeX/jgjdgR4YXygSIJo73UhYyDwzBdt5+vMeo92Fs8L5Mq5V18JfRmwEPbCB17J5
         oR062ouBlk9VFIQJuy49YgxxlAHlVxCGoe3/8=
X-Forwarded-Encrypted: i=1; AL+hErGud3sJUBZwUw1tz/0lZ7pVYD5IHbuiWXkg+E63dx2uhU7FINm/2BXmYgfsULo5MC8gUYdJ9w6KYb0=@lists.linux.dev
X-Received: by 2002:a17:907:9805:b0:c40:33d:f06f with SMTP id a640c23a62f3a-c4d6d7bf946mr154128366b.39.1794167730967;
        Sun, 08 Nov 2026 11:55:30 -0800 (PST)
X-Received: by 2002:a17:907:9805:b0:c40:33d:f06f with SMTP id a640c23a62f3a-c4d6d7bf946mr154127866b.39.1794167730515;
        Sun, 08 Nov 2026 11:55:30 -0800 (PST)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a998a75sm81315866b.73.2026.11.08.11.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 11:55:30 -0800 (PST)
Message-ID: <f79112b0-d4a3-49a7-aec7-190ad4951bb1@broadcom.com>
Date: Sun, 8 Nov 2026 20:55:29 +0100
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH wireless-next 00/17] wifi: add a driver for Broadcom
 BCM4323x USB adapters
To: Ragul Balaji <ragulbaby@gmail.com>, linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, brcm80211@lists.linux.dev
References: <20261026053633.361454-1-ragulbaby@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261026053633.361454-1-ragulbaby@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 26/10/2026 06:36, Ragul Balaji wrote:
> This series adds support for the following 802.11n USB adapters:
> - Broadcom BCM43231 (Netgear WNA3100, Dynex DX-NUSB)
> - BCM4323 (Netgear WNDA3100v2, Belkin F9L1101 and others)
> 
> 
> The protocol was inferred from USB captures of the vendor's
> Windows driver, cross referenced with code from brcmsmac, brcmfmac and b43.
> The code which are copied almost as-is from the referenced drivers
> are indicated in the comments of the code
> 
> The driver supports:
> 
> - station, P2P client and monitor interfaces
> - HT20 and HT40, A-MPDU and A-MSDU transmission
> - 2.4 GHz channels 1-14 and, on the BCM4323, 5 GHz channels 36-165
> - hardware CCMP with management frame protection
> - the LEDs and the WPS button
> 
> Power save, AP, P2P GO, IBSS and mesh interfaces and hardware
> TKIP/WEP can be added in later patches
This is really old cruft and it is a different driver architecture. 
Within Broadcom we called it BMAC and when we upstreamed the brcm80211 
drivers this architecture was already going to be abandoned. The term 
BMAC is also found in brcmsmac code base so it is easy to see where the 
split was made for the RPC interface.

Generally speaking I am a strong believer of reuse, but this series is 
touching the other drivers more than I like. I would rather split it in 
two series so we can apply the patches touching the existing drivers 
first and assure that there are no regressions. Then add the "new" BMAC 
driver.

Regards,
Arend
