Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C301DF72F
	for <brcm80211@lists.linux.dev>; Thu,  7 Nov 2024 11:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730978912; cv=none; b=LmuRBQsGJfeh44xKxWPvqf5Cl7xl66WUv7m9K5QsE/prjB6wOzBOMhdu59aJRaTdHSsqf9eQuPuLRT4lnFy7D7Nyg/87rn/zuWquEF7FtGIvkeUdMoLsi2XQJw7/I/0aJODKXq94vlwmggmZZNf4/D2L7fk9ZA60dxzxi1HSHGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730978912; c=relaxed/simple;
	bh=IY1HzpkIhhrUwXpZp/09h7bvq9rUYqLtageegWz70wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eWHBv/VJaDBxU0FYKRJmdZRD/yvxfzYXfesmsfc49Q46RL4viBcjQwcH/yqR6tyglm3TpSAaQ//RZLl9rkZkuuvowHNECvuq36KyswgKirSd1U2BzgIZqvgwE2tgiw9+sDrjNJHbBL4sMNR7Kjmkc0hGLHGjKmUU6L8FuCJafxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ckt5GOKG; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ckt5GOKG"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-656d8b346d2so619280a12.2
        for <brcm80211@lists.linux.dev>; Thu, 07 Nov 2024 03:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1730978910; x=1731583710; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C6fmBAnuvVsCHVvsoGL6ThhEmwXnlk0q1ZMQAsHbpDE=;
        b=Ckt5GOKG8ypIUzxyJYDqy9k84MhTZ9lG7T6nrjQK+BKZ3lb2e3z1wdfsdJ2sNKo5VF
         1LNeWs/3fyLqCvWr/4txmxgJ2yqzF+OVHXS46br6PFiXCk8uGq3krQn+zI4cUVS0yPZr
         1a/PV2dcUEQP28H7smS2znJreN0uFazTuK7nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730978910; x=1731583710;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6fmBAnuvVsCHVvsoGL6ThhEmwXnlk0q1ZMQAsHbpDE=;
        b=cNI9LqsWga3HthN0qp/tmg2Uo8h7drDyPd5H5HIOlcGU7ccCMmpa3Dr1JVjFliMCGX
         5Ftz+lZq2Olm6J8INE5loVqTe/tXmz3fSaKguoUidJIo43GEvSuPFrseNuV4zumux586
         CFhAIaKa7ex8ojxOsEngwnLzhxsS+PzKtmdE6VH1CBtJ8gCIMMSgfkMH3Rfc6TdHDV9a
         a3J04lYA7/4RRw5mtAznkUazKLaS43Slw287tKPurWRQCUJahMhO0UJh4FsdchbH1W/2
         AtNama6rX8xgz71/s0rOsJiUeTpUZE8/Uysp/4uKJMSMyeb3HdGHzlWoDJMuPOEBHGWn
         NjHA==
X-Forwarded-Encrypted: i=1; AJvYcCVusxbpIM6QMmVXo/Tkxep6K9oFtLcjFamYNAzjpuW9gFHniTuhSuqV5N2rP8xBcqr+Z6XmrHZegBI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyorM6IhZ6uznUjN4pHjT3DCHE4z4vPSGlUsP+adokdNBwRYopv
	QYWZPfg8jkO1Ed14ORwY29SxTWiDDzl3GlQmX4o0PPjTU8JH5cjJYhjbpdQSfQ==
X-Google-Smtp-Source: AGHT+IEwq0tMXR5n2ubnowE4i2DOhkMACMqZrUR9PRTTG4/gbkm/a3y5UpSWrwBlIoZ1B8AHrEM1mA==
X-Received: by 2002:a05:6a21:78a8:b0:1db:e49a:abbc with SMTP id adf61e73a8af0-1dbe49aada6mr17912689637.21.1730978908915;
        Thu, 07 Nov 2024 03:28:28 -0800 (PST)
Received: from [10.176.68.61] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a541d06sm3256418a91.14.2024.11.07.03.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 03:28:28 -0800 (PST)
Message-ID: <d92ce5cd-2a28-4fae-b5fb-82d243f3ab88@broadcom.com>
Date: Thu, 7 Nov 2024 12:28:24 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: Fix oops due to NULL pointer dereference
 in 'brcmf_sdiod_sglist_rw'
To: Kalle Valo <kvalo@kernel.org>
Cc: Norbert van Bolhuis <nvbolhuis@gmail.com>,
 linux-wireless@vger.kernel.org,
 Norbert van Bolhuis <norbert.vanbolhuis@ev-box.com>,
 brcm80211@lists.linux.dev
References: <20241105204011.1603148-1-norbert.vanbolhuis@ev-box.com>
 <87bjyrxy9r.fsf@kernel.org>
 <a2699327-0f86-4c70-8ca4-1225f3e712d1@broadcom.com>
 <87iksz5q3h.fsf@kernel.org>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <87iksz5q3h.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/2024 10:51 AM, Kalle Valo wrote:
> Arend van Spriel <arend.vanspriel@broadcom.com> writes:
> 
>> On 11/7/2024 9:07 AM, Kalle Valo wrote:
>>
>>> Norbert van Bolhuis <nvbolhuis@gmail.com> writes:
>>>
>>>> This patch fixes a NULL pointer dereference bug in brcmfmac that occurs
>>>> when a high 'sd_sgentry_align' value applies (e.g. 512) and a lot of queued SKBs
>>>> are sent from the pkt queue.
>>>>
>>>> The problem is the number of entries in the pre-allocated sgtable, it is
>>>> nents = max(rxglom_size, txglom_size) + max(rxglom_size, txglom_size) >> 4 + 1.
>>>> Given the default [rt]xglom_size=32 it's actually 35 which is too small.
>>>> Worst case, the pkt queue can end up with 64 SKBs. This occurs when a new SKB
>>>> is added for each original SKB if tailroom isn't enough to hold tail_pad.
>>>> At least one sg entry is needed for each SKB. So, eventually the "skb_queue_walk loop"
>>>> in brcmf_sdiod_sglist_rw may run out of sg entries. This makes sg_next return
>>>> NULL and this causes the oops.
>>> BTW it would be good to fix (in a separate patch) the sg handling so
>>> that the kernel won't oops when sg entries rung. That's not really
>>> robust behaviour.
>>>
>>>> The patch sets nents to max(rxglom_size, txglom_size) * 2 to be able handle
>>>> the worst-case.
>>>> Btw. this requires only 64-35=29 * 16 (or 20 if CONFIG_NEED_SG_DMA_LENGTH) = 464
>>>> additional bytes of memory.
>>> s-o-b missing, please read our documentation from the link below.
>>
>> I have not seen the actual patch. Which mailing list was it sent to?
> 
> Only to linux-wireless, adding brcm80211 now. But the patch is in
> patchwork:
> 
> https://patchwork.kernel.org/project/linux-wireless/patch/20241105204011.1603148-1-norbert.vanbolhuis@ev-box.com/

Thanks, Kalle

I am also subscribed to linux-wireless, but search in thunderbird client 
did not come up with it. Thanks for the patchwork link. I should have 
checked that first.

Gr. AvS
