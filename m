Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71381EEA3C
	for <brcm80211@lists.linux.dev>; Sun, 12 Oct 2025 06:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760249758; cv=none; b=NzAkggv79G7p9u7dry8z61Aq6w3SNvuuXzG2EQetgf6Agu9f86uTYB/QUNt9rQw89KsBqoeQjh3IlIguaOt6wppBOFHAHBziDLyyJ2KMvtJ8D25NnP9mb9gR3mLuaHaQxjSLdag0HCegoraMT3w3gXnocaXjfxHvsKXNKP9v6bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760249758; c=relaxed/simple;
	bh=Ex99HcQ2K7x2ufsRjc7Lxmq6FBeEnKmd897J1BZVJXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=An3KXahORZOgxFTG3UAoSggIHG1MtJJo1Y7+z5an2oBYG8uNb4EDCsKsL7s1m7pk4X6Wmrat9NHjcKAqM9dbL02hEYaHyY2GHSe1YRprVg8+GY/bxHF9Ncs3hmDZp9frcQuvL9KLUEgL4bcAAFM8c8QSIvsfL2JvQjkRsKcdXyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=VyZZ4KoQ; arc=none smtp.client-ip=209.85.222.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="VyZZ4KoQ"
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-8582a34639aso232387085a.3
        for <brcm80211@lists.linux.dev>; Sat, 11 Oct 2025 23:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760249755; x=1760854555;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JoNG3GhcaN9M1znc7IxUx2dLvIQ3aEesmiB+jlAS96k=;
        b=sTHU4SOOTzrWRUbm2wNsddvPck/majjLaCU0OiIiZcisasjhHPxpMODEILucg+Kljd
         iAXn+A+43PilNfoJDATKdCWMnFkf9nTOIQNL0j5A6tCzxw0DMvOC2F0KyCMkmxKFdiVA
         NC5mjygM5LzzVZYgnqSAPst9Y+zf8xvKlZ8DGz4Oj+VMAkcsSpdRY7e60NcZ3oEBd3Jz
         G5Jzrt26QB7HVG1wRRKk/GDH9t4i9Ex/hEkIl3bMz/jaOMGRIWYKfF/aIunQ/B5EOovE
         U1kJ/lEa+7Pvf4gpvbEVW1I/cZRU1oAvFPN9Nf1yNCPGjEATYLvZbs67KUdn9UQjDvQy
         TOQw==
X-Forwarded-Encrypted: i=1; AJvYcCUZjBfdS66GN4Lnne8g19qEuBCNUNmNqeSUfSDUi72p6tPFJtC+Wtf2thfZJEpkhZGNdHNOJkeRtrM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzW3yGQNlHDLQgwCGJmY2HYNZqwl6mIFkM4AVYonEqRp9hfkFES
	kzGcWXcYdX5Ry2HNxL1CouP/7/SFi5I4m9O5MBIxAZFtc7AR+43AjsB6lEA4I0SEsMeLcpXbspB
	MP+WreKOCZhChrJrNKdjMyklL/RvX97KyHyvgpGdDNL/p8ufBwIC69Dkeu2TWI1seH/DT9a2k1v
	q9PkyOq+hZvt7PDTGYtAdc9UCA/jZXZcEvkSJdWDWMhR992yr0LBG5csefAiiQbr5eDM0c8j6jF
	Yb39QT+VgZodPmG7deZjA==
X-Gm-Gg: ASbGncvyUsVlzG4wr9Z5u6Ec3y3bCsuUwfyTfDUWei7hzHc3VkoZP4B6lWj1mrw5H6H
	XoHpWw+sGAYkZ477szNww2TC1WEF2KfxB2m3FzGYVBs6TtCurwkMjYhb294+Joo/gfYN3OS4JgK
	9yAb+SwAiLrK3Tgi4coUHVQfmySbQ+viDylzz01OdCm+RFB0pCRaIg+ch7ceacKCnBtOcimoeJP
	WibLJHu4jO5cJQOrf+b35Z7M1yd/UROYQ9GmX1RDlFGPHuva3tZjWpM5l2XEo7GZ5xpMPXOWIux
	TQbaW5hHdjae+hbUeauOpXoX2B/wCqOGvaKp2QGGMqBxkhDU1Np6ng7dTtOJ2eI7inyOCRPXCFz
	Eeuc1w9Pj4Mb2OVRNp7HBUSkafZAhNT3qyTML5JquTj+gUGSDb1G8ivAQwHfl3R5vQKZxcgPwv9
	t1eXw=
X-Google-Smtp-Source: AGHT+IHbJFGboVLCKFSKyZzJmdgAH9X5rLtukPpOhPpiDOoCadqtMgq5cKcHxgetNFz4ce5UT5/FJ7d98xEn
X-Received: by 2002:a05:620a:26a5:b0:86f:f323:15af with SMTP id af79cd13be357-88356517f89mr2610431185a.39.1760249755411;
        Sat, 11 Oct 2025 23:15:55 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-8849cad6ff7sm66030285a.0.2025.10.11.23.15.55
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 Oct 2025 23:15:55 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b4ed2d44df5so363217666b.2
        for <brcm80211@lists.linux.dev>; Sat, 11 Oct 2025 23:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760249754; x=1760854554; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JoNG3GhcaN9M1znc7IxUx2dLvIQ3aEesmiB+jlAS96k=;
        b=VyZZ4KoQiDZ1FMroRlmvJHbEW2pbkQNPKHw2kj8GYzlqjxj+UxU+9kUwFVA5UtUu+/
         TsyKqNBrFjaZF2V9DMscOBc12YsQUmrjLt+cm+MCC3j1BpxXsmtx6Jz7pM/qIq8QhdU3
         XZeRU9W1Z3waRWmbhDy+5FLa7WxDA+mMxvrM0=
X-Forwarded-Encrypted: i=1; AJvYcCWAR792gHX13A045C/rG1k+PhiyltrOsyF5nae6nynI/K1d86x+FZiFSJ5Em/hWm4f8U4otH1moZGw=@lists.linux.dev
X-Received: by 2002:a17:906:4fd3:b0:b4c:137d:89bb with SMTP id a640c23a62f3a-b50aae952eamr1420711066b.29.1760249753717;
        Sat, 11 Oct 2025 23:15:53 -0700 (PDT)
X-Received: by 2002:a17:906:4fd3:b0:b4c:137d:89bb with SMTP id a640c23a62f3a-b50aae952eamr1420708966b.29.1760249753297;
        Sat, 11 Oct 2025 23:15:53 -0700 (PDT)
Received: from [192.168.178.137] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12d2bsm656576266b.49.2025.10.11.23.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 23:15:52 -0700 (PDT)
Message-ID: <e5903078-7bd3-4267-ab79-b97190ef3bc3@broadcom.com>
Date: Sun, 12 Oct 2025 08:15:51 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next] wifi: brcmfmac: fix crash while sending
 Action Frames in standalone AP Mode
To: Richard Reigh <richard@govivid.ai>,
 Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
Cc: brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 chris@streetlogic.pro, linux-wireless@vger.kernel.org, s311332@gmail.com,
 wahrenst@gmx.net, wlan-kernel-dev-list@infineon.com,
 johannes@sipsolutions.net
References: <9a0849d8-befd-4fca-9d5d-a24520ccfa26@broadcom.com>
 <20251009073928.6803-1-gokulkumar.sivakumar@infineon.com>
 <CAFwtOaU45QEO=1jMsvM9EqbQ8NVYgDnXzV5k2s5xVaZo-z2zVw@mail.gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <CAFwtOaU45QEO=1jMsvM9EqbQ8NVYgDnXzV5k2s5xVaZo-z2zVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/10/2025 8:35 PM, Richard Reigh wrote:
> On Thu, Oct 9, 2025 at 2:41 AM Gokul Sivakumar
> <gokulkumar.sivakumar@infineon.com> wrote:
>>
>> Currently, whenever there is a need to transmit an Action frame,
>> the brcmfmac driver always uses the P2P vif to send the "actframe" IOVAR to
>> firmware. The P2P interfaces were available when wpa_supplicant is managing
>> the wlan interface.
>>
>> However, the P2P interfaces are not created/initialized when only hostapd
>> is managing the wlan interface. And if hostapd receives an ANQP Query REQ
>> Action frame even from an un-associated STA, the brcmfmac driver tries
>> to use an uninitialized P2P vif pointer for sending the IOVAR to firmware.
>> This NULL pointer dereferencing triggers a driver crash.

[...]

>> +bool brcmf_p2p_send_action_frame(struct brcmf_if *ifp,
>>                                   struct brcmf_fil_af_params_le *af_params);
>>   bool brcmf_p2p_scan_finding_common_channel(struct brcmf_cfg80211_info *cfg,
>>                                             struct brcmf_bss_info_le *bi);
>>
>> base-commit: 94aced6ed9e2630bae0b5631e384a5302c4b6783
>> --
>> 2.25.1
> 
> 
> Hi Gokul,
> 
> I tested your patch on Raspberry Pi Zero 2 W with kernel 6.1.21-v8+
> and can confirm it fixes the crash. The iPhone now successfully
> queries network information without causing a NULL pointer
> dereference.
> 
> Tested-by: Richard Reigh <richard@govivid.ai>

Hi Richard,

Thanks for testing the patch.

Regards,
Arend
