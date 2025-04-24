Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B072288C3
	for <brcm80211@lists.linux.dev>; Thu, 24 Apr 2025 11:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745494577; cv=none; b=Q4RXSwMnawX0iIOZE46nmzvEtuhVe+qqsy7x9AzPvi4EK20Sk0NJoYxL+uwInO0KJXZ7wb4kcdY9vCGblBbs6DNxj7K1dmUt/y93ndZmzpWP5o5c0NeqGkOkW3AL5z6Wntx3c40u2Nb9b0DtCE56D2yIwVjw7OYCr05vLjJ+NVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745494577; c=relaxed/simple;
	bh=ygwn6N4M2L4N7h5yXVl5zzhHo+vSvfRx3ULGoe8z16U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kaKsrqztar/2Wb7lkZINoqqIRsOxb/OiswkJFnYdvKcgBIp5p+2CfDitZLzQ/O8LHNuUKxODCOfeK4RwqH0qIcXx6iv6YUqyxrgfkk0Yij9AyM3ZInstNCc46rPppImpkoS+SDzHMQ4UGrUW92KioJImmYwYSL6T7zFityLLJH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=azkViZ5A; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="azkViZ5A"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72b0626c785so800684a34.2
        for <brcm80211@lists.linux.dev>; Thu, 24 Apr 2025 04:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745494574; x=1746099374; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L+0XDCLnK8fIdTiFMqYFT3n4pduHHFwEZ3TDRIZa7V4=;
        b=azkViZ5AbQfkv/TXJWW1PYxMVaDQOu4AKink+rmRYeikXg7wbDxXgQKICF4iDKaXcW
         zpXqfgDaAZtKL9vNAw4vKszmfIVX/9ltHMpt06Z92QUPVP6CvquHagoyGDDmzysHzzkt
         tj7dZn5GuEXba1L8gjS9qTgMKwxZlHx9nP2r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745494574; x=1746099374;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+0XDCLnK8fIdTiFMqYFT3n4pduHHFwEZ3TDRIZa7V4=;
        b=tRrT6L4F8kHvmG7vkobbjMY45Crg/qYKvucdn+Jxvf6331oLzX/ijoMHFR142JxOz+
         p9VFEccStieT57kvGGqxdJFV5ehJHT99dCxeLAlMzpuK+7ggjnMj9IQVuvx0OBya1G9C
         pXnrkGtE3Zdg/HNqu8NeFGSJtEyowXQ59XdE7R7bUKlFJeR9+Ya3gm6WG3f5/mlU6rnl
         yMcGWoDj7tEzWd44Kq76Wwk07Cfj2KBoljNlrWrIsp2qjIank51S7Zy3RaSq0weOKeSq
         o3+TEcN6Ge6WVimf2DF1WhSvr6ZiwrN/boYZwlepWPAxvt7b7xpppwblsntAR/M4Tl/O
         UuKw==
X-Forwarded-Encrypted: i=1; AJvYcCWkCn6CMoCeNlfJQKuIDhk+BUD2f/sXfJAhJI6QpXdi5X4EfLjR6F5Owmh6Mpny+6k9cn8VJnT44Gk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt0FGaV10bxrcGcCuO+E5RPh5plueUTaBz60o6/nQc946Ha8PZ
	U1diijhMSuJ/ffJc40FA4or/Lby1CqgGHNth9LYWda3ia3g7GkM5ZDUYoAMChA==
X-Gm-Gg: ASbGnct3HJmqZL17HiXM1X9N+ltdaDMkvL88spjduLEqJsQah+D7PvC+S+HHpmyuMyb
	NXKk/ur/MzJyHc2jV0dJAsaO8sCUyNONHPlnQXR+gGzGYR4XOX85NW/6d18HmOe7p6s5wMRXI7c
	61kQ4P4q0mwTA0WHxiPXrmKLQ9Eu+l+CxIlmgdokYLuMgnBE1GinvUE5puYi9MOzmJclNz/33vw
	72YLYeRiEYCisbBuE4Kvme42Hb7kYTzndkDIehatGYK8tDO2uE+J3eLmozVLQRdWmhql/EYvpUt
	afbH0S3oZ4Av5FhsTT0qrNPYRQHZ3oM20hBfLGmHlN3hBpu1ZZdLcWrYeCEG6ptL2X8F
X-Google-Smtp-Source: AGHT+IH/JBXa+8LAVqbQLpFsYj8x3iKTM3lgy/ZRCoeXD32J3PYg3rh0lQJO2FdJg6e+BSFsJnRVGw==
X-Received: by 2002:a05:6830:6a12:b0:727:4a6:5b31 with SMTP id 46e09a7af769-7304dbcdc6dmr1677141a34.22.1745494574351;
        Thu, 24 Apr 2025 04:36:14 -0700 (PDT)
Received: from [10.176.68.112] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7304f3987cesm202125a34.57.2025.04.24.04.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 04:36:12 -0700 (PDT)
Message-ID: <2a6f7d20-2901-46d6-a16a-b977ff0a3724@broadcom.com>
Date: Thu, 24 Apr 2025 13:36:09 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] brcmfmac: support AP isolation to restrict reachability
 between stations
To: Johannes Berg <johannes@sipsolutions.net>,
 Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 wlan-kernel-dev-list@infineon.com
References: <20250423175125.7233-1-gokulkumar.sivakumar@infineon.com>
 <b6a11804b93df6052d61a7069d7ed0bd74a972ad.camel@sipsolutions.net>
 <4a9c8323-5598-4783-90b2-ace84db22088@broadcom.com>
 <9e6febe76a55053972049b13b254474a82b26571.camel@sipsolutions.net>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <9e6febe76a55053972049b13b254474a82b26571.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/2025 12:22 PM, Johannes Berg wrote:
> On Thu, 2025-04-24 at 11:50 +0200, Arend van Spriel wrote:
>>
>> Looked at other drivers implementing this callback and here are the results:
>>
>> [wil6210] wil_cfg80211_change_bss(): does exactly the same thing.
>> [wilc1000] change_bss(): worse! it accepts everything and does nothing.
>> [rtl8723bs] cfg80211_rtw_change_bss(): same. just an empty callback.
> 
> OK, though I guess other drivers being bad doesn't mean this one should
> be :)

Sure. I am on your team in this. Can you recommend a plan of attack 
here? Should we add a mechanism to expose what BSS parameter changes the 
driver can handle similar to what is used for struct 
station_info::bss_params?

>> If this patch means Infineon is (mildly) regaining interest in upstream
>> wifi development let's not discourage them.
> 
> Fair. I didn't mean to discourage. I just think to meaningfully
> contribute upstream people should follow the list. And even review other
> people's patches. I've been meaning to make that more of a requirement,
> since I can't possibly meaningfully review everything I now need to
> merge.
> 
> https://lore.kernel.org/linux-wireless/21896d2788b8bc6c7fcb534cd43e75671a57f494.camel@sipsolutions.net/

Yeah. It's a bit of a tough spot I reckon.

>> I do watch the
>> linux-wireless list on occasion but I am a bit lost on your remark. What
>> do you mean by tree tags. You mean the "wifi:" prefix? But then I am
>> confused about the "subject prefix" remark.
> 
> Oh, well I guess terminology:

Ack.

Regards,
Arend
