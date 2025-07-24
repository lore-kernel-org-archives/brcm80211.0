Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F4E23E340
	for <brcm80211@lists.linux.dev>; Thu, 24 Jul 2025 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349992; cv=none; b=n+wdzmB1M/xxGcj5syF36OJb/DdP3UiPdTxwmnEgl38Oz4TK9ch7BpQ3qD8Lk10mcD2WuP9tQ0Q7AykhDyzpgiLHK4i8Y41YimCaO8DEEZSK5cQ9yaj6DKjO/BXp5vjQZuQzo8cja7qu055C8cOkdUT4n1bjvWrRGjpW4xmNods=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349992; c=relaxed/simple;
	bh=izc6ZtFtUUTc/gvqzt08ghE4XQn99bjTUrW3q0pOB28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/nACn2bAED5OxTF9Sg18O5EKrDh4HFIu8oYWuiZsBXWw7SMqNIoeC+9mGj3EF9rSp3pGSk/90dNBdggljxMFqNvi2yNMWATs9h+0dvqyc94nOMjCABVQTPWx/L4bgDEKuizk0rXwC3DppNgxzo0sIaShUS+jYusZ6h2uOIZk8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Kpa5o832; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Kpa5o832"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ab60e97cf8so10894211cf.0
        for <brcm80211@lists.linux.dev>; Thu, 24 Jul 2025 02:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1753349990; x=1753954790; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IIjGGXVf11weW5oQjKnMXKtINVjpGksDSkfazxd3id0=;
        b=Kpa5o832Ji+eBi0J0WVyn+tPrDNojubO5q7t4uGum1ujiWXDoke2q7GTyQrpVUp8ZX
         U9oSiCW6O8j9xIPPVPdFlVidS+hNwR2vMcK1M4BQU4IXf8fvUSq2kiEfg3DyWqlC+HO3
         2e/G2tZPohdueC6RibB9nv9VTzNxAQ/nmN4t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349990; x=1753954790;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIjGGXVf11weW5oQjKnMXKtINVjpGksDSkfazxd3id0=;
        b=WMlfsy6MOPbjL+JXE8c1xICMEkxXG1+L4WcB1Tag1SRfnTpiPexpVrP7BMVWArxWM0
         kEVyaqdr+N+/RHmVG/Ka+WZWTCcfYDVmLIggyDhsYbSPMf7NploljbsetJF+KrjrYKRc
         oGPF5d1xNubYP8mMuoOMcBdAIYhLz5aiK3JHjrpzwRflY6BtpPPRaVOFF9cvTZsOv4av
         XTYyrcSw0GeI4KdL+JWLHpyuujCjkSrzsOEZvAHIKW7EW2gB7pOUKFsjFD9U/lqamqv9
         J8NzU9QVYMd0dGVuth3CK4MzLjyqMOK7wwhBc16J93+ObdnmwHRwApQvcBgjMvfzg8R6
         p1Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVVP/8NmoKAAUgW7++ksmOzIbcgQW5QorDgde4h9mBCQmhPRC/hiVkbmj13hboWZVEBx/Vmu+xNUho=@lists.linux.dev
X-Gm-Message-State: AOJu0YymXxu2uDOPl70zuHEyah48c0erjDxabJXGLtyOU8efssnTXCEm
	e6HmcaplJTNnBYyxNMYsyIduWmhkyhwezUuJeaUZcBubK8IiYhLFMj2pFhJdHpttxg==
X-Gm-Gg: ASbGncshV0WmagVTjXHicoD5Xuoa4Orq5sXgnHKai6PiSnHp/NHUR0JXWt0sBmA1p/V
	ut34n9/nGT0C2VEq12JgxAFO9OYV9I2yhdDZ75FnNBqZ2acE5TcLlcuAZ0Ntr8ewwryI1kOEaQ/
	UXISvu4Ep/t96/JIVfj44Kas9cai4tx9YaxmD7DPFONbhc1UHdMRdKqwQ9+A8IZ+C4us0jcpWXC
	Z3i5/CcLQMaKHIKiwsP2Pqh1+/nkgxWmr6A15TvU6FEQTf71Cvx05trvI45cN+REJVAsm+cMEGU
	TpmFUphnJkHUzB3wt2evGym65Pvp2mc9U3SLFUPl0bJnS5s2oZc/Q6YuHxYAW1rIPzWb4ecQjhr
	zOEa0Wj2t4GnOhpwCF32UYes1Ii8asx9HVY1GxzUatPt0op1SXUm+T/LZyvku8g==
X-Google-Smtp-Source: AGHT+IGNfXV1njPjLllSN7Yv5xduPy+7quFPky0yA0lxKLqQntvSccAoh4yqAbOZbCF3QOHbmmvClA==
X-Received: by 2002:a05:622a:181b:b0:4a9:957e:abfa with SMTP id d75a77b69052e-4ae6de7331bmr86722251cf.20.1753349989786;
        Thu, 24 Jul 2025 02:39:49 -0700 (PDT)
Received: from [10.176.3.57] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae7e5189d6sm9142561cf.35.2025.07.24.02.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 02:39:48 -0700 (PDT)
Message-ID: <084b0c7e-1ef4-4522-b671-d9dab84537dd@broadcom.com>
Date: Thu, 24 Jul 2025 11:39:45 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: remove 43752 SDIO
 incorrectly labelled as Cypress chip
To: Johannes Berg <johannes@sipsolutions.net>,
 Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 wlan-kernel-dev-list@infineon.com
References: <20250724084613.6336-1-gokulkumar.sivakumar@infineon.com>
 <432d50a2995dee6c421aad6bd21acceec191990e.camel@sipsolutions.net>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <432d50a2995dee6c421aad6bd21acceec191990e.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/2025 11:15 AM, Johannes Berg wrote:
> On Thu, 2025-07-24 at 14:16 +0530, Gokul Sivakumar wrote:
>> Cypress(Infineon) is not the vendor for this 43752 SDIO WLAN chip, and so
>> has not officially released any firmware binary for it. It is incorrect to
>> maintain this WLAN chip with firmware vendor ID as "CYW". So relabel the
>> chip as "WCC" as suggested by the maintainer.
>>
>> Fixes: d2587c57ffd8 ("brcmfmac: add 43752 SDIO ids and initialization")
>> Fixes: f74f1ec22dc2 ("wifi: brcmfmac: add support for Cypress firmware api")
>> Signed-off-by: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
>> ---
>>
>> v2:
>>   * Relabelled the 43752-SDIO chip from CYW to WCC instead of dropping the
>>     support for this chip as suggested by Arend.
>>
> 
> Maybe update the subject now?

That would be nice. Please not that the vendor ID is more about the 
firmware API that should be used for the device and not so much about 
maintainers.

Regards,
Arend
