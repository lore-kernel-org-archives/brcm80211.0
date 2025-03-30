Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691DC19F117
	for <brcm80211@lists.linux.dev>; Sun, 30 Mar 2025 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743329640; cv=none; b=QlAmb3focxIgAFKTHCLNz7Seeybt5oPZ1Z90lxUSbOfUHjbQqx/2NfZUquFcCJ//YtU60jdbmysHhGsecer4q1WVMM1xkildArxObx5f95qHe3y2m+5+z8YfLndaGQNKpOx3Tuez8R9xYIMCG7gGdhAzmDQbcV7zQjczWujyCG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743329640; c=relaxed/simple;
	bh=5Dn34M3j1J/0yG2xzBOIVJdG+eWKyBdZzWhp6uW6JiI=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=tBnJ1bYvF/GQ5SwflgEgucYQKI5kf8xIlyYnWXpSIHCz50Z1zFxTk28/rlEeF0wsTcEb9nQHy5HHUgHVKVjZKhHKZnroTcrwoC0kHpCQoU/t1JZJiwvRO2TRhUFE2Yqy2StUMeu9diUTEN27lG/VfIh7BemEO6vlJLs749QZBeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Hv0ubnM0; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Hv0ubnM0"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so1880635a12.3
        for <brcm80211@lists.linux.dev>; Sun, 30 Mar 2025 03:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743329637; x=1743934437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JU9e44tO6FJo/GjHldkKNGDusFlokQ2t2C9nEsto6Fo=;
        b=Hv0ubnM0yBIzP4jjLfRFNAIP4JVIKSDL/rlenogTzYDlVxUxF402Pv1mxhJsClwCtE
         T/temAL5gprlUX9+3DpIz1V50VRQJobAL7MROu73R7iN7SoeD+bCJjWmi0QrTnKgCmrv
         sBMM78CAAwMuUlIkYvZCNVEk6qTMHc36dp48g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743329637; x=1743934437;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JU9e44tO6FJo/GjHldkKNGDusFlokQ2t2C9nEsto6Fo=;
        b=AQW6APnLmhkfHoHtkJ5vI2n+v1LkEPnPp0Q5g99Ws4M7FyoZnpKUrNG/rHFdAEd2RM
         WonGhRhVoL01zewUxw0IsilMcx10/g57dMrNoyEiDDRE8KEBZTFdRkZThj3nTdFtRh3i
         Y89slOSZ+j5NjMC3wuSCxXohTi47WUU2XfzGTD4IkqXySiJ02Nst6YF1GU06IAbP6osW
         P54sVXTBvd8Acd9triGlLpdYyr3zLtVj4PHiFbKX8q/Ppt96fo0EdBcAtWIg9kg1ryQP
         nwlydl+FD76K48i+b4zO6QYhPAjdA2WuOXJggpWdir/p7qsf3xcivhkbeCbudOy/uHfo
         vFEw==
X-Forwarded-Encrypted: i=1; AJvYcCUU3NIfZv+UYrXAbLtbuAUHXsFeNqsyuQUCLOJ4vpBsXF3xODHPKLKsJA6JUTfqe9KzlNmjHcEjWyg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWYNfVYWFJnfSUylvuUKO3aSW4KddaL5gmNfP12oO5G21tC9vE
	peB9BvF8/fEz6JueHx4NP++qvruhiPOKP9LUMNd/KB9tMDWvsIHuemKAlhV4NQ==
X-Gm-Gg: ASbGncu6Ju1lSKU3Kmh/StHSvVEtN8jhJaxukNJD+1aWHOmVcok0kx04BEZrCBslhey
	Wu+HY8o6XMKx66g3Cwn8WHfXcVDPZ3rF7YLqOqi/kSj2rBTBSe73ezAUv04kdF5lJw7W8flsZpK
	ZfyjUjFmg45ftJXxAMlQ84tQQGUCiryGxosy/IG0ZaL2/2LcqR6zBhH7JRShSNs4jHFSQ7arNAO
	BhrENSsS1kk8rDWtdcm4shOvetIZhrcoIPt8ldJgiY9XzO/E1WTpsYr+CK0RyRTMIF1q9d9nH0f
	zrx3Nk5eD5swCk3nVFRj5ZlZxNTuLglanfrwGaP4hkVR9+7b05CaHnU6DCq8pKjrkUvoC9T4Qij
	7GUVZFlk=
X-Google-Smtp-Source: AGHT+IEhOwFN64RAI12GBOewic8rItD3qND4hzZYF1sIbS+MnHfLx1/+PRibZCWYf0GY0riRMXCk2g==
X-Received: by 2002:a05:6402:3490:b0:5e4:9726:7779 with SMTP id 4fb4d7f45d1cf-5edfcc1f72fmr4865313a12.2.1743329636709;
        Sun, 30 Mar 2025 03:13:56 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17dfc4dsm4084750a12.71.2025.03.30.03.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 03:13:56 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
CC: <kvalo@kernel.org>, <jeff.johnson@oss.qualcomm.com>, <toke@toke.dk>, <jacobe.zang@wesion.com>, <u.kleine-koenig@baylibre.com>, <megi@xff.cz>, <sebastian.reichel@collabora.com>, <saikrishnag@marvell.com>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>
Date: Sun, 30 Mar 2025 12:13:56 +0200
Message-ID: <195e68b2ab8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <195e686b618.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
References: <20250330093505.22370-1-abdun.nihaal@gmail.com>
 <195e686b618.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH] Fix memory leak in brcmf_get_module_param
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On March 30, 2025 12:09:04 PM Arend Van Spriel 
<arend.vanspriel@broadcom.com> wrote:

> On March 30, 2025 11:35:41 AM Abdun Nihaal <abdun.nihaal@gmail.com> wrote:
>
>> The memory allocated for settings is not freed when brcmf_of_probe
>> fails. Fix that by freeing settings before returning in error path.
>>
>> Fixes: 0ff0843310b7 ("wifi: brcmfmac: Add optional lpo clock enable support")
>
> Good catch. Thanks for the fix.

The patch is fine, but a minor procedural nit that I should mention. The 
subject of patches for brcmfmac should have prefix "wifi: brcmfmac:" as 
shown in the Fixes: line. Hopefully Kalle can take care of that.

Regards,
Arend

>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
>> Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
>> ---
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c | 4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)



