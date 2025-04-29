Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6A9212D7C
	for <brcm80211@lists.linux.dev>; Tue, 29 Apr 2025 10:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922750; cv=none; b=FbCHysWDZDsdsG8op7MUhUMbFRNOepkyPLQ5j2ZFMXKeog7yVftNIMF/bBLoGCidT5u9PK7BsuBfRhCkQxhtMjCWsR/7dDekqzwmEzzDRykVy/RYVZjGLQuuVXV3n5gL3fSxiyBbC9sxBVxZgxPiPQq51yvQ3Jg863wUkg39cqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922750; c=relaxed/simple;
	bh=pVOEihRnRE+Z0u1ocEp1AUh8hWY9xVt8Kvc/bH5IoAA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cGkWsJrUgggmeOgFaOG4e1KqBNDXkUYtu/r80gcnpE7SwmSjEp5iKs5zriXoBC/LMlMZenc7A7RoywC72m46PMmAm8wD6Ksttw2JHb17Xdljzi+42Z1t7hgxg8iNJ7M48IqEGcFeIxZs3CyUChPE7gnDXi876L/Lr52RT4T4IE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=P19LnmW1; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="P19LnmW1"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22928d629faso61556175ad.3
        for <brcm80211@lists.linux.dev>; Tue, 29 Apr 2025 03:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745922748; x=1746527548; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IjjaM/klkMvTvRSKbX5PiREv2tZEFfSaFOzOVftX4/Q=;
        b=P19LnmW1qxE8aCQsRqnTAzhD70RdXc19TXxKsmMXb6LB0zU9kO6PHNcFJWGvTu8NWf
         +RpG71c9yI8/fjignp012F5y/wCCqjCSRtnU8Kn4WhLoM52nzQQY0w8dWOZKipddWdP/
         F2wa8knCQB6j3A1riw3t9WztinMc5ZFygZVjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745922748; x=1746527548;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjjaM/klkMvTvRSKbX5PiREv2tZEFfSaFOzOVftX4/Q=;
        b=gwj05MPuJ6+QeD875xTyeiN05kteUqqSoBUvSHEIjSwHxX+bpol6M8Pf1LG0QCAqfK
         0SPxS6/MTWsGDoIqw4Hms92RY5x37y6f4TF3NsOD9SUwOFaqoh0BJKvAs1/JpdSJyEOg
         AK/XuHUP83gzRjcBXqzrGGMao/Ba64Dg5GjvuoG1YY3UlkofNvXjULLpqpmyPdG73oYH
         RkgTyd0k3nP3sBj8AMa+qQlIeuyF1KQaI2tAhhFWAJv9U6vDxDd7r6sldKifft1tWba4
         yUgMvRE3bjEYK//q5dz6crcL9c7gF7RC/imVZHJF5qMgOm//DS38MPpx1y1uJF2j6a2v
         canQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc00d/ezx+moavubHem5c4ts72JtLd0QiMszhrcjvBBewLWfw2IPRkbrkQsNjyJkn84nQtDzL5CZg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvCd8dOT5lwpaBbsVkouIgIsLTdmw+vbKc1m/aOc9Y4T/N5FBA
	BCgypM8oM1ZDxmKYBV+wHMJ31ZKM0Z4GgbyFFycwMtPeYRiLRWN/9T6smV8Lng==
X-Gm-Gg: ASbGncuTSePdksjvrmWXkakwtbj+vLdP243L9tVzdACNUcMehCRBYJU7KM6uJ3OTnnd
	CvieWpXKnrqbXapu1zH8e71bxpalGqVD7YZqYrryBgPtrDech58fAivaWbWcbDyVPByyeQi86XO
	sa1+cDrwBGqFuNph0uE/ZMIenydCoc7I0imlpKgmyhB82PA7TSL6Yie7ZL2sNyb7lM0FiCQcxOv
	BheRruUpGpB/rbH5bg96vPpLsb/irmgr1RqDujB4jTDec9TJoVPLOknxGTnWKWX/bt8YTJKesQ/
	VLqfU0rx+SFF9aE6Chi8Y4qrUJXU48jokMnMg4oJuW3Uk1GccGGer2hDN9IDoNnUmD3y01QBTuU
	5OU8IK0X8G6luXLoP
X-Google-Smtp-Source: AGHT+IEg40dwHxFLL1AgrQtEfvp2eK5Wt13G8fIDqlVyp4DZxKgB1dRYVp41zxwizAupgj/n92Y95g==
X-Received: by 2002:a17:903:1b2d:b0:224:26f2:97d7 with SMTP id d9443c01a7336-22de5ec18b4mr35836415ad.8.1745922748280;
        Tue, 29 Apr 2025 03:32:28 -0700 (PDT)
Received: from [192.168.178.137] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db51053c8sm99039635ad.207.2025.04.29.03.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 03:32:27 -0700 (PDT)
Message-ID: <ae43652d-56fb-4393-9599-6899c99c93ea@broadcom.com>
Date: Tue, 29 Apr 2025 12:32:23 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v3 0/4] wifi: brcmfmac: external auth
 support for Infineon devices
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev
References: <20250425085519.492267-1-arend.vanspriel@broadcom.com>
 <CALeDE9MGXiSN=8E+T_ZGOLHsk8DB4iL=hV7ircqqb9=q1xTUYw@mail.gmail.com>
 <1967fbdeea0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CALeDE9ONCUH0pQ4Yux=30Lim_SZMcbQsnWx0R+aPhF0E7tf9=g@mail.gmail.com>
 <19680c23388.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Content-Language: en-US
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <19680c23388.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/29/2025 10:55 AM, Arend Van Spriel wrote:
> On April 29, 2025 10:19:00 AM Peter Robinson <pbrobinson@gmail.com> wrote:
> 
>>>> I will try and find a couple of other devices with an appropriate
>>>> cypress/infineon.
>>>
>>> Thanks for giving the patches a spin. The firmware should have a feature
>>> named sae_ext. I think the one you with iw are indicating same 
>>> support in
>>> general.
>>
>> I am not so sure.

Sorry for the confusion. Damn autocorrect. "Indicating same support" 
should have been "Indicating sae support". SAE offload support means 
that firmware is doing everything, ie. SAE handshake and 4-way handshake 
(if not mistaken). SAE external auth offloads the SAE handshake to 
user-space.

>> RPi4 (BCM4345/6 - 7.45.234 (4ca95bb CY) FWID 01-996384e2)
>>        Supported extended features:
>>                * [ CQM_RSSI_LIST ]: multiple CQM_RSSI_THOLD records
>>                * [ 4WAY_HANDSHAKE_STA_PSK ]: 4-way handshake with PSK
>> in station mode
>>                * [ 4WAY_HANDSHAKE_STA_1X ]: 4-way handshake with
>> 802.1X in station mode
>>                * [ DFS_OFFLOAD ]: DFS offload
>>                * [ SAE_OFFLOAD ]: SAE offload support
>>                * [ 4WAY_HANDSHAKE_AP_PSK ]: AP mode PSK offload support
>>                * [ SAE_OFFLOAD_AP ]: AP mode SAE authentication 
>> offload support

I think you mentioned earlier this one ends with an error. So SAE is not 
working with that firmware despite the claim. How about WPA2? These 
patches should not affect that, but better check if it does not cause a 
regression.

>> Jetson TX1 (BCM4354/1 - fw 7.35.349.104 (775a9ab CY) FWID 01-d55901b0):
>>        Supported extended features:
>>                * [ CQM_RSSI_LIST ]: multiple CQM_RSSI_THOLD records
>>                * [ DFS_OFFLOAD ]: DFS offload
>>
>> So I have different brcmfmac HW reporting different features.
>>
>>> You can check the firmware features in debugfs under
>>> <mount>/ieee80211/phyX/fwcap.
>>
>> I don't get fwcap on either of the above devices:
>>
>> ls /sys/kernel/debug/ieee80211/phy0/
>> fragmentation_threshold  ht40allow_map  long_retry_limit
>> rts_threshold  short_retry_limit
> 
> Ah, yes. My bad. They are only created if CONFIG_BRCMDBG is selected.

Appreciate the help.

Regards,
Arend
