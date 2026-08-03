Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C01F3AE715
	for <brcm80211@lists.linux.dev>; Mon,  3 Aug 2026 08:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747303; cv=none; b=iuIwBnneLGHj4Is/99Q4uYcQCZBF56JUTYSn1unBn1cixSAxHZVbDCnBkPGtEBSCUOJG3VYmPyrLSq1izwhpAqriTDz1g2xuNmcXjjShQxSZKwccMNgMQZdbQHyhK0X8Km2MFg4ldwC3B6JelKzHSySj4BtTrIME0wl88Rl2ATM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747303; c=relaxed/simple;
	bh=AV0pToG9zNPBiZyyn1M9cI3XYMude2xTH+l+24aft2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i5U4b1GxUViiRZDeBdSwRKAbxaTdxjWBaBTugv5gBJYfl4SSbOksSrf0h5cjyp4fO1hh40vmDEyDlldASubtDvNBfykW1D73o+hC4KkU88AHyhK1PGXp9Tmg4REr9Jy51dAtXEKSYt5RxDxNCi7PPqF076Yj7VAQZZznem2Phjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Er0aJVmS; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Er0aJVmS"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso32345515ad.1
        for <brcm80211@lists.linux.dev>; Mon, 03 Aug 2026 01:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747302; x=1786352102;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6QujGCeTnnZ3aprREzL53swawys0bVa+jOxZyTHDqDc=;
        b=kS8qGTjzQkiMXRh2/l+eSxDjHULRcxUVibIrf8/4R83h655jb3Ue+TkIAB4sRz0mgC
         VdDzm2DbCrA4cFWUNnRvn+j/hy9Xpw6OKybZDJ+ubse07ONjYwW91cnG422LiyFQzTRG
         bkSNgiDNjfvd42oJO0RUaEpDMt9cg1N/6fTKK0+oBHrH9DsricTYlKEdbz/TyVfwOQoN
         0fsO/PMDsKk1fJg0664z0q4KfPjRi9mGUiAjXeccAsEBjR1dUI/uZWyLngWxBFx+F8av
         L0kXbF2MgjG+H1yM6IuLWzkKn7O3ifkK5YM8O1dl+2UPn8hw2Vk5xi2vrToNWEXfYjMU
         BTbg==
X-Forwarded-Encrypted: i=1; AHgh+Rqes3vg/kxt0ugwefCnpTQ7tP6SNajcaCKGn1xjN+rT4rBpghYwp4iwu6SOLkz5mtBDT49Ced7I9Tk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+xKOoZynVJ5WPjgWd8Du8C15VAI/q0vf6E4PfjydIj+iCb46p
	DsT3IxEhYJQITgx/BeORwLXVPOyWztNDj0DF10L3hnr2kkY8sp89weIMZ1CZ2OCQwdMG2dFEuv0
	QVYP6HPBDYTQm/AHVx3DW2qZeI3qSuVY8WVCxDEneGkOLvwCyi0HHXXH1iW2hr2sehksc3FJ2Fr
	j/VsSvVfbfnujQ/MqvUEjeX7luvtGQG6VMQ/sSoxB4q6gqZ5uTzYQiAn5Jgmt72k+W1UFL9d+v4
	NLfaJ7G/vHv1O2UVSn4FQ==
X-Gm-Gg: AR+sD13hO4MqSDNF+2QPb6Pxv7B4T2TP0ZCAbAqZDWOPMcOa9QVuMZl3IAv2Z6cs6z2
	S6TZ+JabPEq9VKRDL1X97fks537nY1o8C4yFxCAzGMPY+LqtReYzl88rumu+Gzkw22ujkJdd16h
	YpCwxymGVxyD86u0GUO97y0QgRzWPJ1XzFXrYtMQsuM6lYWbMqgYN6y88XbvKxrxRCm7iAGRQo6
	5Q1mjj1+b/v18BsHBsNdGdoRVOqaKJ0nZT2Nc+f3oWU7lzdIYhCfKDcms6lWC2xNGF5LDnUjysZ
	s2BIG8fyxBOeXNPLIPWFz/UkMVqUDWDp0uK4jEx/3bWQWgmP6rmwzYlugyVlp8iKg9SfRuY3+wA
	KE+1xiXhCjyUbVKVj4sle/hO4f5Z38jozjua8o2ZfO2cWOpcs2bQuRw4hP26gUejLkjuwL8HhYf
	SMzS1vXiz2WTxnIcSBbbaXN7aqASfpxrdZtoIY1cw=
X-Received: by 2002:a17:903:390b:b0:2cf:bfbb:61e2 with SMTP id d9443c01a7336-2d0524723b8mr89413755ad.39.1785747301558;
        Mon, 03 Aug 2026 01:55:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2d04ae87b77sm9495795ad.15.2026.08.03.01.55.01
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Aug 2026 01:55:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe3fa93bso29123201cf.2
        for <brcm80211@lists.linux.dev>; Mon, 03 Aug 2026 01:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785747300; x=1786352100; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QujGCeTnnZ3aprREzL53swawys0bVa+jOxZyTHDqDc=;
        b=Er0aJVmSLbuUD3TdkP9bM7EyWjRDFocDhf9eJb+tHaJGndAVX48eNbqk1ioHyzKQYx
         NMk40gx7x310KcCI1Tc6qSZ83tV2CjCQs8rLRBqrVQyzSq9f1LnQ6Wxya05/gLr1HU3c
         wDMALcWU3HNiX0FaL5Mu3/1MXa/LI4MJRtze4=
X-Forwarded-Encrypted: i=1; AHgh+Rq2BRpYKTqd95KHJEVbTSX2t2VD6ExiHzqLc+uOWHrQTzqQHIWxyQoB0/xODDh9q53AV4TTEO5r/w8=@lists.linux.dev
X-Received: by 2002:ac8:5fcb:0:b0:51c:e14:87ae with SMTP id d75a77b69052e-52b5686a056mr179473331cf.34.1785747300352;
        Mon, 03 Aug 2026 01:55:00 -0700 (PDT)
X-Received: by 2002:ac8:5fcb:0:b0:51c:e14:87ae with SMTP id d75a77b69052e-52b5686a056mr179473231cf.34.1785747299954;
        Mon, 03 Aug 2026 01:54:59 -0700 (PDT)
Received: from [10.176.2.103] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908434a2400sm70190036d6.18.2026.08.03.01.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 01:54:59 -0700 (PDT)
Message-ID: <c5aad785-8d7d-4015-a3c9-1f70f2a69579@broadcom.com>
Date: Mon, 3 Aug 2026 10:54:59 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: Fix memory leak in
 brcmf_sdio_read_control()
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
 <c2589f1c-c754-4282-815b-df64f0250623@broadcom.com>
 <e628d43a4aca1763cafcde41338cf7a34fe57d6c.camel@sipsolutions.net>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <e628d43a4aca1763cafcde41338cf7a34fe57d6c.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 03/08/2026 10:35, Johannes Berg wrote:
> On Mon, 2026-08-03 at 10:21 +0200, Arend van Spriel wrote:
>>>
>>> I looked at moving the vfree() to the done: label, but the code also
>>> gets there in the success path to wakeup waiters. In the success path
>>> the buf is stored for further processing so it should not be freed.
> 
> Hah, my bad, sorry!
> 
>>> Maybe better to do:
>>>
>>>          spin_unlock_bh(&bus->rxctl_lock);
>>>          brcmf_sdio_dcmd_resp_wake(bus);
>>>          return;
>>>
>>> fail:
>>>          vfree(buf);
>>>          /* Awake any waiters */
>>>          brcmf_sdio_dcmd_resp_wake(bus);
>>> }
>> Actually it turns out brcmf_sdio_read_control() is only called once so
>> the brcmf_sdio_dcmd_resp_wake() can be taken outside the function.
> 
> Or just something like this?
> 
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> @@ -1827,15 +1827,17 @@ brcmf_sdio_read_control(struct brcmf_sdio *bus, u8 *hdr, uint len, uint doff)
>          if (bus->rxctl) {
>                  brcmf_err("last control frame is being processed.\n");
>                  spin_unlock_bh(&bus->rxctl_lock);
> -               vfree(buf);
>                  goto done;
>          }
>          bus->rxctl = buf + doff;
>          bus->rxctl_orig = buf;
>          bus->rxlen = len - doff;
>          spin_unlock_bh(&bus->rxctl_lock);
> +       /* buffer is queued */
> +       buf = NULL;
>   
>   done:
> +       vfree(buf);
>          /* Awake any waiters */
>          brcmf_sdio_dcmd_resp_wake(bus);
>   }
> 
> 
> It's already using vmalloc() so seems it wouldn't care that much about
> calling vfree(NULL) on the success path?
True. And yes, the existing vfree() should go, but I figured that goes 
without saying so I did not mention that. I am fine with your proposal, 
but I guess the author will have to submit a v2 patch, right?

Gr. AvS
