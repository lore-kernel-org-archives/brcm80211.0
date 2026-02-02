Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B502E3AEA
	for <brcm80211@lists.linux.dev>; Mon,  2 Feb 2026 18:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770057085; cv=none; b=uvbvGJI1z8qxlWRmegbGBXNOFMOKkYAd6oSQX7HXl+3CryVNYrszC3zIVkdlJPsHRMCo+vAmk6OX0GUuygcFvCTyS5jXbZzyDiXvDYcunZSVua4CTWat+e0PJT24dmbXXpSGVuuqm/IqZMSbBDjZfPP+d9AwMAycegU3F1o/u/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770057085; c=relaxed/simple;
	bh=FFRMhOH0i4hv3RLO6HQP+kTxivBZeU2yKE5VeAYog18=;
	h=From:To:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=SEVlgPBPEkY96aURmttrdUpQRnS8EZ6Dv03DNB23b7gJk8br6RPW+jycpX2QkPyQokUagJL8m/Zxa7VfyFcQ2fQsq69YBWMYG7a7lDNNyd2ZairEW5ZX+9m8SQomRFcF/taVJs6F4CDmEew7BYQeVF4ZpibSRRRMLpEqYf0nG3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KVWJpRqw; arc=none smtp.client-ip=209.85.219.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KVWJpRqw"
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-88888c41a13so61295476d6.3
        for <brcm80211@lists.linux.dev>; Mon, 02 Feb 2026 10:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770057082; x=1770661882;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgBc8O/BAmD5N4ZalAoTu4LjXQUHSz9aZWoFX8AATM8=;
        b=W2yyEOdbwmHXA1YNKy0No1/GxLyQgt4nqvxDU29YcQnCJKF6eDUf4KuUgOjPqhGOhG
         Aww3Tya5Z17xPypdq2cllYy0zxpnIeWgYmrT3mBaLhoiJXjuH2mSiEtg3+50BI+cqheP
         V0OsOZuqREaUeeAdCXcIRTebor6ArRNQAtEQvEzcbziuSRRsenLawAqE0nBiDlaemo6O
         yw5NWTge7TOOApZYnVdKiAp28xQzo+0hBAQ6Tp1XV4+nSpsaS9kobS3xVZUWNxArJKA9
         broaI8nbh08Kb5OBy8DECQRb5P+Sisoew77ALguro+7Ry9N86bIg+nMLunii/ILV1UBE
         GEpA==
X-Forwarded-Encrypted: i=1; AJvYcCXFL89QlPHnvWntfahXgBHJ1VkbyIkJiSQGm9oGTDUYdFzS9mFVvfzSvKkMR0xCdewFNRzxUG8b9GY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBz+0rWjxFIcjcx/7C5ghZmzzjseXTnB+dIG0yR1XxwZUfhB1H
	c2KEg3FvS1mXNEcqcKlkOh72h3GKsDTr4w53cmmg2SVU2uYNoWYckjnR8GXXIir3/4jaLXPL/k8
	myp9cPHZkfBoZOB7ffBUIvsBQMt0fDSLR6XQmJKxyxbIxhfKagFMpHQcaTodP7xgzl+TNq8LfVR
	Z0CJW+9+MdUMgp/L0ra/3Z7G7ztik6wCA8GuWjeW/lGk0RUgEnWxs9vWNFGqTeeSwTIUL0o4c0A
	ijNq+TKshALDcgY33s0kw==
X-Gm-Gg: AZuq6aImDbKj7Xq0cZoLlDNBkgUO+2PLuuIUaDKJGbc/N059qNJG95ifILhRFAaC+nn
	mZuMCLzIe8nHDKBgHYvBQ0aJcBUSU9hgTYbSahlfeHfIuwveOpNU9QxMedpzyk0VcmmAnLqHBvi
	drbORjo9hnNm5WNn0WkZk4+7XveaE6Ly1UKIlchYWf/8ggeaUtiJx6QeJYLtRD/UdHQtF94OITD
	8Ds3e2rw7aYh8Px0z2Wd7opLyRl0WatVZWOOHwtxEXJDswcRxnWyUc15R8UU+NqlGEEmi8eQ7qD
	YltfZM5L7jwIYKPY2k2OyKhCgCV4KdRyGrR8FpapSk6XZuewhWOmX329bUUxX0yN68WvPdx62IR
	cPmaV2SrxFXo6fLG7t1H6bYRWL+gQSgUDnTYUMyfEMw5YL/DvwTERKPc3h8A2kH00qMHjIOZbk7
	jbY2ay8SYsObuIXEdXE1QdMnhebRtcq9GZEl4TNd4Op1So3h/CvuE=
X-Received: by 2002:a05:6214:411:b0:894:7fbd:87a9 with SMTP id 6a1803df08f44-894e9f7026dmr170388756d6.25.1770057082215;
        Mon, 02 Feb 2026 10:31:22 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-894d36c15bfsm24208616d6.9.2026.02.02.10.31.21
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Feb 2026 10:31:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-409ef98c150so2804961fac.3
        for <brcm80211@lists.linux.dev>; Mon, 02 Feb 2026 10:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1770057081; x=1770661881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IgBc8O/BAmD5N4ZalAoTu4LjXQUHSz9aZWoFX8AATM8=;
        b=KVWJpRqw99Riec/gBMSVk1NWTxq5kwaOgm9Lhq06DMIs86sQAqz9lZGd7zytIYWiQG
         lDrRicNASOVMQ83NfyJKK6rQrZcDmmZfg3m0nULpy1wZAFgB2Seq+2QFZI3PaoftV8dF
         SZXTqxj6W6Lpt7M86uFCPPPtDatkOgCGjBnag=
X-Forwarded-Encrypted: i=1; AJvYcCXfrqlIhePD8U6WdAXvz1DtaKWosR1sR3b9eyshOfx1J9lvUp/zI+G0aAoZ+oGvlCFjbNdNkIYo708=@lists.linux.dev
X-Received: by 2002:a05:6820:2c0e:b0:663:126b:b8c8 with SMTP id 006d021491bc7-663126bba9emr3380301eaf.8.1770057081162;
        Mon, 02 Feb 2026 10:31:21 -0800 (PST)
X-Received: by 2002:a05:6820:2c0e:b0:663:126b:b8c8 with SMTP id 006d021491bc7-663126bba9emr3380288eaf.8.1770057080768;
        Mon, 02 Feb 2026 10:31:20 -0800 (PST)
Received: from [10.229.40.14] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662f9a4e491sm9980208eaf.16.2026.02.02.10.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 10:31:20 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>
Date: Mon, 02 Feb 2026 19:31:17 +0100
Message-ID: <19c1f9f9108.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <062fde49-7438-4001-a06e-50175547b54c@samsung.com>
References: <CGME20251231143556eucas1p141b278048039730d03edf85c6f3e5350@eucas1p1.samsung.com>
 <20251231143544.4158840-1-m.szyprowski@samsung.com>
 <74e3bb49-ebbe-4692-b278-c04f2a30bf96@broadcom.com>
 <062fde49-7438-4001-a06e-50175547b54c@samsung.com>
User-Agent: AquaMail/1.56.0 (build: 105600589)
Subject: Re: [PATCH] wifi: brcmfmac: Fix potential kernel oops when probe fails
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 15 januari 2026 00:16:31 schreef Marek Szyprowski 
<m.szyprowski@samsung.com>:

> On 14.01.2026 14:45, Arend van Spriel wrote:
>> On 12/31/2025 3:35 PM, Marek Szyprowski wrote:
>>> When probe of the sdio brcmfmac device fails for some reasons (i.e.
>>> missing firmware), the sdiodev->bus is set to error instead of NULL,
>>> thus
>>> the cleanup later in brcmf_sdio_remove() tries to free resources via
>>> invalid bus pointer. Fix this.
>>
>> Hi Marek,
>>
>> Thanks for the fix. Please consider my suggestion below...
>>
>>> Fixes: 0ff0843310b7 ("wifi: brcmfmac: Add optional lpo clock enable
>>> support")
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git
>>> a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
>>> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
>>> index 6a3f187320fc..6615748fa5bb 100644
>>> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
>>> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
>>> @@ -954,6 +954,7 @@ int brcmf_sdiod_probe(struct brcmf_sdio_dev
>>> *sdiodev)
>>
>> Maybe use a local variable bus and assign it only on success:
>>
>>>      bus = brcmf_sdio_probe(sdiodev);
>>>      if (IS_ERR(bus)) {
>>>          ret = PTR_ERR(bus);
>>>          goto out;
>>>      }
>>> +    sdiodev->bus = bus;
>>> brcmf_sdiod_host_fixup(sdiodev->func2->card->host);
> Well, that would look much better, but sdiodev->bus is also assigned
> inside brcmf_sdio_probe() and I didn't check if this is required by the
> functions called there or not. Maybe brcmf_sdio_probe() should simply
> return error code to make things easier to track?

Sorry for the late response. Indeed the bus instance is allocated and 
assigned to sdiodev. So that is something the caller needs to repeat. So 
changing the return type of brcmf_sdio_probe() makes sense. The only thing 
that should be taken care of in the failure path of brcmf_sdio_probe() is 
to set sdiodev->bus to NULL after calling brcmf_sdio_remove().

Regards,
Arend


