Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B4E25E807
	for <brcm80211@lists.linux.dev>; Mon, 14 Apr 2025 09:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744622906; cv=none; b=Yq5992l3zH8MDWxFuJEoWoChEh3HAQXY5KZpZtHNmy+JRCAdP+mZeMAxH42QRBLCVBnx1rrp698rNlAmZYoMAB8RcYyGKdrMUK6hGnaMFkK/h3sq3luVMKt2o30boqm7r14/aLzLGFpnTaAsOQLuvT/GWrpPHJqPsK9iYltyvOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744622906; c=relaxed/simple;
	bh=1vnferAzKT3MsbkrCeVw49kjueGkwshd4AHMNLIGBns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELvHfi7FfuZGEQvui7JPaaXE0bdVjv2bmbxyubvUW4ZY9IdCLzaglrAAHw4zVGCfDtTv+ZkKU3oOnyFeyjt98PmBAa2VaT+RWomcO+zzMA4lZv0ODjKCkZBz2xaNVOuObwMyfXYHSUIe+YuVpa5zR8t1x08SXJuDuwtOhxMFPYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dn8hcl0C; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dn8hcl0C"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3fa6c54cdb2so3322041b6e.3
        for <brcm80211@lists.linux.dev>; Mon, 14 Apr 2025 02:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744622904; x=1745227704; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7VY/Fgrsg+Wz5rLhMXbdQEU2fXLlv3RPzj9N820ixuM=;
        b=dn8hcl0CBrUaEutsDXykYDlFnGvXzzt90pFcv6w28iU6a1QmwpTEtD1iTr9PDJ9Pg7
         STE46V6NJisb9cSpDLj4TYlmRtC5PL7+g3moRHWge4aOeI41EJC0U8bWhiQq0ksC19mi
         T+obvVyg0PS9cok2Yw30ezlNqKPE3pQ3840oI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744622904; x=1745227704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VY/Fgrsg+Wz5rLhMXbdQEU2fXLlv3RPzj9N820ixuM=;
        b=s9QoD2Pzu2DKBS/elko4hddInUjT0ptzNiD3mhiPn6fkCSctCX90cnpHZJvNR+c0Ps
         IPqGiiklqoMvonZEJPgElwjioNF7dXg9wX1kqby/UDIuCK8IacG0BJ2Z2VOlPlOm7Yik
         iV8DtQZOUh+KRaf5LomNFOGYESQaHpGYbkiyQvnnwoY5MT0QaqbKiuMQRPFXKZol85ot
         k+b+GP700QtNqbH7hfS9dMaqIlrnYoUPTAiaWeMBsR6erh8/tVKCAmlUJLYfrGL9NU8n
         GggMHnFsw738TW2bzoJ0A0n17ritln0dj+KuM8Vts71Ufs7qZdgIFtVRWXcwQaa9FrgA
         WjnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo63aXCwISqHX6DhE0AprkRRuntdZqulthu9AwmULa7sLkwbgfEN1ukyxBSWCxbsXTKegoCoPoMrQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzD5ZHrwrm0lqbdUpLzQgU04I/Ogs/62yUI4WCC0VAJtdB5aMZb
	lAkj/5ev9YDu6Hn1RgEhZFPgPi07Tenq+Ck9tIQukfDSyF2LI3SWjBugynypUQ==
X-Gm-Gg: ASbGncvRI4VuPQoZgzLuhnhPW5IvJUyVtPVm2LfcUpF43pPshsHpTf60wBgdghtCdtn
	U0BlgSyIQf31dJ3RQs/C0Egcfu9AsHCSe8kou2vRtZaMgXhi7yEAAgAPRkWNQE3VBc6dq47dgLU
	w0akirzyUkTWJ47dc5T/+XaqJH2KHJBjTKcG/AHB/P3yhvzewU5dFcInIf6npGBQE9jNYXfS2ne
	UsNOgU4SRITvvtWsnla9mYc8EaVFLVlQ2BOp4wfmpSLsnGy50rfY/imLC19ztCaZs2qBzqYm/9p
	1LREuO269xeaYn5PRCUFj2FHhCCkARznAFcqfMbPybiQ4bVa9cdQijggyI69OKQ5IT0=
X-Google-Smtp-Source: AGHT+IHKV537btjyYbi1yFgzpC3om8mwKvNmnVLq1zpkUlwpQPwtj5Ip9v5rf3PGXZFDD8kO0FLfOw==
X-Received: by 2002:a05:6808:191a:b0:3fe:af0c:6eaf with SMTP id 5614622812f47-4008501dca0mr7965228b6e.1.1744622904157;
        Mon, 14 Apr 2025 02:28:24 -0700 (PDT)
Received: from [10.176.68.80] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6045f5b28basm1820500eaf.36.2025.04.14.02.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 02:28:22 -0700 (PDT)
Message-ID: <52c832ab-1e67-410a-a0f0-91703d24c9c0@broadcom.com>
Date: Mon, 14 Apr 2025 11:28:17 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] brcmfmac: Add an error log for brcmf_sdiod_ramrw()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: kvalo@kernel.org, sebastian.reichel@collabora.com,
 erick.archer@outlook.com, megi@xff.cz, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel@vger.kernel.org
References: <20250414074232.2342-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20250414074232.2342-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/2025 9:42 AM, Wentao Liang wrote:
> The function brcmf_sdio_buscore_activate() calls the function
> brcmf_sdiod_ramrw(), but does not check its return value. Log
> the error message to prevent silent failure if the function fails.

If the reset vector can not be written to device memory the firmware 
will not start and we get a probe failure. While it seems useful to log 
the error I suspect that the MMC/SDIO subsystem will also provide some 
feedback when we can not access the memory on the device (SDIO CMD52 
failure). Oh, well.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
