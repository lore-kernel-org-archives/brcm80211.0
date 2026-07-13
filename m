Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7766F3E8357
	for <brcm80211@lists.linux.dev>; Mon, 13 Jul 2026 10:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939908; cv=none; b=ir2Nf7MguHYJTIFagAOwnuA5pC1AQR1uR6R7QX1R3mZ2eGJBhLmU1wvKk6m5VuIfXXWLEQGS+OoVgUm7K56xy2NnJ9XeK+HBI+vW3cq1dW/vQipGF7rlaMu6qVOqMtS27eu7bB9jbd3ANh2HGP+4Eu3RBhlXGf0lH+TL4JDq3IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939908; c=relaxed/simple;
	bh=ztP+Lg5fklMhhuTpaIR9LJ0qNO0Jn8X8jfLGw8P7Y/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuLgKczDE4+0ynxWBbEfwk9bCe2ZbMkop9RN01TCtR4pLOI7+SunRoGBT1SOm7hYUBNlAkKuM86ONHSo1Es3//SCEKJHtTIWh36HXIH3pt9T4Gyo+R48ezRT7TvThsYa72qy/b1UoxwSCde1Z/clxlJlTzjlHJWqDf2os9ycQxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=iIZScxU1; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="iIZScxU1"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso29652215ad.1
        for <brcm80211@lists.linux.dev>; Mon, 13 Jul 2026 03:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939906; x=1784544706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xAMD//Z3RnvPCQ/mYGTihmrUMMj+M8oLlYOH5HAiHag=;
        b=dTmNG4xr0RJt24LvzotzsZpUbxSCOawjZibZBSDHxoXjSLaf+AC7/ATPLN8iFFmXL0
         CxsTEquFTrznKlI1xJtJFhDbDB4Z5/m9cdJVdn9o2IgMjY75nDyRErnQ7KSQEK1J9g0I
         hbRs6/gPfIn7F+JOyOSlkZg1dYOpCSfv1whNb6KHrmPzrbYmvMufOe4utSYIW6Q4MVSm
         IdYxxnYgGfQmdcPMN8XuRnwl5HrqMvb8CXvEst+2UfeEgxJENZoEi2lyQ4x15ch/8e8x
         dZjZLri2b3RP7jy6rde3rOdMLurNiWF71tFk/qyj8seGqCGXgEqnaKdQQnIyl1qqrymB
         uHpw==
X-Forwarded-Encrypted: i=1; AHgh+RrtS4pjy0djMiCnItem9IdbZi1Eqv+mDTBArUxRgiOsQa4iGLz/2L/4HrkKZpKXZUPO2Gz7L02jKVw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQzCBnaaopFSfP7/GVeKM/Bo6KVEu3a7Rag85g6JSqqAz37FQ6
	oOLApaJApBcBORO3qbMS/1FuXhA5JynR9Opoe6YTjR0v7alUu4OR5xGdYeZkyGuU5DsMg90A+++
	6vkJpGB3uKw/ndFEKmIwgS73Yb5FFmf03qvWtS0ThJRfWDVOg7jf7krrG8SyiVPIxJyNSM8sSXq
	TSeZgc2Q6ZFmdSG8Ml6IkCFeW1nphqDLg1qkrgcNbQ6bAH/GnpZsXQyYyIRJ98v+6V9QtbIgmBr
	ZHMUd853qoLFFZByPoKPA==
X-Gm-Gg: AfdE7cmgJ7hytZobN4zfZcjcWmwGoMh9/QKzEeU3LMQKJYgv3a0lLwCjxql4Oed1RUJ
	mmylxgtNKSjTb3aVw1pj9mTpmhxBnh8sovWQJ5VnbNol92COLkhZHrO3bt14/po29mbAfe1iy2M
	u7QKO52svSR6/H7/7y7PGv+Me0kwaWZlWXGCkX5flAb/GXxX/OK4uDoRxAUijh42qOlM/AGphP2
	xZ/I4DcK3SdoI+pjFukshEiIiFxI1sb80n7SCpe1yg3Z2wVSi1W/j5gNwH5N44psYYz5nVohoRL
	aTfVYQYANiH+6Bsk68P12Hrvcf2Dr//2xKQ/dhFGJxmAvPbFxsCUTsQzAAV3UdpNaas6AcLA/Mp
	0GHSmHZ39WQPw/8fDcPFffaSvFCvNCLtSzeZucTbSec0sNlFesx+2xeId5L5UDwRDsxo8cmbk8V
	BpNYcCYNKzwiGNCQLbbdgxT1Z51MF8qahlu9EcMgV3p9KvK7c=
X-Received: by 2002:a17:903:2f8a:b0:2ca:d91e:bfb4 with SMTP id d9443c01a7336-2ce9ef1bd0amr78967915ad.24.1783939905845;
        Mon, 13 Jul 2026 03:51:45 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ccc99c3da9sm19612475ad.0.2026.07.13.03.51.45
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:51:45 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8efe7db1c42so48947316d6.3
        for <brcm80211@lists.linux.dev>; Mon, 13 Jul 2026 03:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1783939904; x=1784544704; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAMD//Z3RnvPCQ/mYGTihmrUMMj+M8oLlYOH5HAiHag=;
        b=iIZScxU1oO8T2mIN/Pa8zLnmiQePqeq7uzkOlcsUyVchCgjCT5IVpJcKb+cYRgePlL
         LxLGtlUQUTiTL3QQMkOQV0mgwq0WiYnHOQ9Nv7Az27AWJ2P+0hLcuWTzj3CcAznYgEE8
         u0Y/0dT1C67baCLPRBsg2PmpXkSwFusLT2mBs=
X-Forwarded-Encrypted: i=1; AHgh+RrBcAiVNuXTBjpFEbxaGmyqLgBjoOdlfiLoZjgGR2O1RQf4JbMamtQKDivs5iSmo2xJQy2PFJXVfiY=@lists.linux.dev
X-Received: by 2002:a05:6214:238d:b0:8f2:67bb:a37d with SMTP id 6a1803df08f44-9040471eca3mr96339736d6.57.1783939904535;
        Mon, 13 Jul 2026 03:51:44 -0700 (PDT)
X-Received: by 2002:a05:6214:238d:b0:8f2:67bb:a37d with SMTP id 6a1803df08f44-9040471eca3mr96339506d6.57.1783939904024;
        Mon, 13 Jul 2026 03:51:44 -0700 (PDT)
Received: from [10.176.2.203] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1d3acsm124246046d6.24.2026.07.13.03.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:51:43 -0700 (PDT)
Message-ID: <36f4388a-b856-438c-8ef4-795a7b1eda3e@broadcom.com>
Date: Mon, 13 Jul 2026 12:51:45 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: set F2 blocksize to 256 for BCM43752
To: LiangCheng Wang <zaq14760@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Angus Ainslie <angus@akkea.ca>
Cc: Wig Cheng <onlywig@gmail.com>, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260713-b43752-f2-blksz-v1-1-8697fcfeaef4@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260713-b43752-f2-blksz-v1-1-8697fcfeaef4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 13/07/2026 10:50, LiangCheng Wang wrote:
> The BCM43752 is not reliable with the default 512-byte SDIO function 2
> block size: on an i.MX8MP board with an AMPAK AP6275S module at
> SDR104 / 200 MHz, an iperf TX stress test kills WLAN within seconds:
> 
>    mmc_submit_one: CMD53 sg block write failed -84
>    brcmf_sdio_dpc: failed backplane access over SDIO, halting operation
> 
> Commit d2587c57ffd8 ("brcmfmac: add 43752 SDIO ids and initialization")
> set up the 43752 like the 4373 for the F2 watermark but missed the F2
> block size, which the 4373 limits to 256 bytes. The vendor driver
> (bcmdhd) also programs a 256-byte F2 block size for this chip and runs
> the same hardware without errors.
> 
> Group the 43752 with the 4373, matching the F2 watermark handling.
> With this change a 10-minute bidirectional iperf3 soak completes with
> zero SDIO errors at ~270 Mbit/s in each direction.
> 
> Fixes: d2587c57ffd8 ("brcmfmac: add 43752 SDIO ids and initialization")
> Cc: stable@vger.kernel.org # <= 6.16 needs the CYPRESS_43752 id name

Looks good to me but the stable instruction looks confusion. What do you 
mean. If there is no 43752 support there is no need for this patch, right?

Regards,
Arend

> Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
> ---
