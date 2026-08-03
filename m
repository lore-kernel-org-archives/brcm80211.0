Received: from mail-vk1-f227.google.com (mail-vk1-f227.google.com [209.85.221.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574AC24E4C3
	for <brcm80211@lists.linux.dev>; Mon,  3 Aug 2026 08:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785745270; cv=none; b=Aayl/viXaA7hNm6WDKfT6rusmvn67vQPe7BQ/BCp2RsoY6zIScsPIiUnmbFvBVjVufPmenT72GVNThi/PdLaKvVtiPSIR2drnz0JlBj7YtJHmkA9E8tW296dwDBAjYUYWkZTW7/2SOxjU6XaEW5tRweYjE/Zrp+BtCQNmfmTVZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785745270; c=relaxed/simple;
	bh=Pg0dLujnHeta+8k9PUkwaeX7IBhCH3Vp8JK79I4o2qs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=S5NAjOaGC3iviDALeSmMaruAkiBAb7wyl8Bq3pIpFImlOn+vEZOGgrggFx9ROBSwPkDDm0O4DLuihq0TaZwCdd5jT770Ys7WZslIBiVhRJBNsmBcSsqTEV9VrwqfDar7kpDJF+ascq4gp8rwwVB/0vvAPGFAm7UgUo2obdfRDk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LAnBCDuF; arc=none smtp.client-ip=209.85.221.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LAnBCDuF"
Received: by mail-vk1-f227.google.com with SMTP id 71dfb90a1353d-5c2dbaf828eso1119328e0c.0
        for <brcm80211@lists.linux.dev>; Mon, 03 Aug 2026 01:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785745268; x=1786350068;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=umawf+BlMbUojF4hA2eaASvm/LHe9PC11Jo6AdX6bp8=;
        b=eV6Rd7OBy3RbsiHG1pcNdjg+vBURPd0J1Pd6uMImF2pNJouwN56Zk+7ShCj0BhV9Fc
         Kmx2bgGgUDwv3DoRjw47mGnaB44PLwKnq8WNr56UH/UY62Kfd8oz7/vL2I5DwRHbFYrY
         +j+2UGHzgzUU6zLufaVcaGxIeR12M/qI2ICDUwvauyelpNWLT03rm5Dh36QL4rymrVY1
         QgFiEH1On+aZ5ZbomEG1kHJdZJQJ7m4WmcaXswus8jGBXOESF5bTjRFeixCOkkZDgFLY
         rE5oklRQ/n0g1qgaU1Gi6fyVy/v7Fxy892GrsWMRWlaqDWuyVWG6Vd4G0jbZZvhUGDTL
         eiPQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGMWodqoFHFXyipu1PFShCMOJ4C7qh0Cc+5yE9Kg8V98k43CfNO6nYe/gb8KxWN3Ze8Z78unO07uE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKA+p90n4XFx6BaS0ZAM8laZoiljz8K9rTQmmXyugydSRgWsS7
	ingbxzjY4bf6BpTwcFzQ3GasTIdtgSZQqZDuHrO6J60t6z3ne/qO6aKHZT7HwZkz8RqrpOkFG+p
	rI3uH435qxq5Oj4gZbEcn5O4hYD3c12vpNXHWK9UKOMtHPsAhBIQIHEabhdEdyoZido2JnMZOml
	nGNTNide9V0IwPHGDyF1Dfbk4USbJpTYUpugdTpm6czBDpUKxO0Jm3mMMY4tPlo5EE8sA6E76Zg
	1+2gELxPepfdg8V3Q4TUA==
X-Gm-Gg: AR+sD12JLmqJ2gmY3e/ssb74yKnjesQchFcglN1cHY6UWXxVfhMtL7qVGvKrD1BEjLi
	sheM0B83XIkQyQUEURuvMoiFjuKoj4OSptQ8E0TFc09VUX9bKoTMRdRq/kTsDLtwnAxxaWtyNoH
	w3k0rm40LwyilBErvAMuTVptF/I4ZNjZt9bH43xzmsI+6Ha31zku9UhtRTVXltmx/U6ZoniTnK/
	ZckmaOPTyI20XHFGCOoqgFdxmUnkSs/qw0gDBjoeateE25fzqfZarWiNcG/lTWGRM+msHD+Jkka
	/vEtjRlR94kMbOCQaLXmPRX9HjnxZQM4xsfmTMAvinoKjFE3wcN6pb+C6ixFot/Y1HtFXFoUZAS
	K5PLq5jE1IYCUhKJKzt16rSMt6cIBosAU/aHDsX9cmHGH/3xGRdXM166F4Ubzzzn7kPBSGBTOCD
	A7GD0IpcEA3niFKgXHQ08X8DZ9pgCAtaQ7Z9X2y88=
X-Received: by 2002:a05:6102:2908:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-75b2448670emr6363467137.13.1785745268072;
        Mon, 03 Aug 2026 01:21:08 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-977e6625d41sm527375241.3.2026.08.03.01.21.06
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Aug 2026 01:21:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so4435949a91.3
        for <brcm80211@lists.linux.dev>; Mon, 03 Aug 2026 01:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785745266; x=1786350066; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=umawf+BlMbUojF4hA2eaASvm/LHe9PC11Jo6AdX6bp8=;
        b=LAnBCDuF7ya8QMScQRvd0DeVBPjIhDyEjXFmEeqVbbIllrl3RlkvA4SGhMmy+cq7Nz
         EYA2H2NMRA3lSSyqSpAASyWS7OMan93AkZiORrLXIwMjY1LWWCM6zoQKcWeEaYsxwDMU
         0CyNdw7PKJTI4z4kceAzG87frT8/SmEy6V3bg=
X-Forwarded-Encrypted: i=1; AHgh+RpAI9FUDMJTZ70UIynezZ7i3sk5+1amZS2gRDWRi1i/M/vLY52w3eMTzm9CGV9v4yjwtWXTxE0Vgwc=@lists.linux.dev
X-Received: by 2002:a17:90b:4f48:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-38fbc4ff4ccmr8731219a91.20.1785745265926;
        Mon, 03 Aug 2026 01:21:05 -0700 (PDT)
X-Received: by 2002:a17:90b:4f48:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-38fbc4ff4ccmr8731186a91.20.1785745265384;
        Mon, 03 Aug 2026 01:21:05 -0700 (PDT)
Received: from [10.176.2.103] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9be04sm33069820eec.9.2026.08.03.01.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 01:21:04 -0700 (PDT)
Message-ID: <c2589f1c-c754-4282-815b-df64f0250623@broadcom.com>
Date: Mon, 3 Aug 2026 10:21:03 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: Fix memory leak in
 brcmf_sdio_read_control()
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>,
 Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260722110713.115988-1-nihaal@cse.iitm.ac.in>
 <20260802083905.3819981-2-arend.vanspriel@broadcom.com>
 <e059b52701d3cad4480dfb506e61474924b9f29e.camel@sipsolutions.net>
 <6648c1d61a44ad732550ff20c0b1aecaa43676f6.camel@sipsolutions.net>
 <19fc626a040.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Content-Language: en-US
In-Reply-To: <19fc626a040.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 03/08/2026 07:44, Arend van Spriel wrote:
> Op 2 augustus 2026 18:44:40 schreef Johannes Berg 
> <johannes@sipsolutions.net>:
> 
>> On Sun, 2026-08-02 at 18:41 +0200, Johannes Berg wrote:
>>> On Sun, 2026-08-02 at 10:38 +0200, Arend van Spriel wrote:
>>>> On Wed, 22 Jul 2026 16:37:12 +0530, Abdun Nihaal 
>>>> <nihaal@cse.iitm.ac.in> wrote:
>>>>> The memory allocated for buf is not freed in some of the error 
>>>>> paths in
>>>>> brcmf_sdio_read_control(). Fix that by adding vfree() calls.
>>>>>
>>>>> Fixes: dd43a01c5cdb ("brcmfmac: use dynamically allocated control 
>>>>> frame buffer")
>>>>> Cc: stable@vger.kernel.org
>>>>> Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
>>>>> ---
>>>>> Compile tested only. Issue found using static analysis.
>>>>>
>>>>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 3 +++
>>>>> 1 file changed, 3 insertions(+)
>>>>
>>>> To be applied to wireless tree.
>>>
>>> I'm going to put this into wireless-next, at this point (-rc6) this just
>>> doesn't cut it, the commit message makes it sound purely theoretical.
>>
>> Actually, I'm not even going to do that - sprinkling vfree()s over the
>> code when moving the one that exists would be sufficient is, and I'm
>> being generous here, not a good change.
> 
> Sorry, Johannes
> 
> I looked at moving the vfree() to the done: label, but the code also 
> gets there in the success path to wakeup waiters. In the success path 
> the buf is stored for further processing so it should not be freed. 
> Maybe better to do:
> 
>         spin_unlock_bh(&bus->rxctl_lock);
>         brcmf_sdio_dcmd_resp_wake(bus);
>         return;
> 
> fail:
>         vfree(buf);
>         /* Awake any waiters */
>         brcmf_sdio_dcmd_resp_wake(bus);
> }
Actually it turns out brcmf_sdio_read_control() is only called once so 
the brcmf_sdio_dcmd_resp_wake() can be taken outside the function.

Gr. AvS
