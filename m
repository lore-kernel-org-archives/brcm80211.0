Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709692;
	b=ZyH41NtIp4qhTuG7lD2BEVImtXe9AsjY8YsfroLd+dBPLNcrlxhTjUhvnj2/Ajb3KHbd
	 vBq5mAlVBDQ0PEoM74w+vzfeh+hJ8CWUyXwHWfRCZg+x5bmuCjWIJUn0Fee9iykMUyabv
	 OiCoZ3QPzP9n40uXHnKT13EyhUmmGOkN9+iu6VXuedfehsLKm0v9lJFHzN6xPwrn7l7vJ
	 bu3QzVVeOwEAHTQcfRQfmhCj63XoMVt/MlFUy+oXTpuIOYff5VbtkHB7lmvRIWa0O3EBK
	 GU3MEwpjtp8x+V6UdOJA54UVDZR/dOCDowpSHXLcwSY/X1OUNo+IUIEVHm++zvJtPVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709692;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=OG2zu+3pFucE1vcX6/TAGudL+NIy1Iy8ppAf1TtVtOE=;
	b=OZSgnaulWniA84oxF2ZKNN/gTJHSYaZ5P/4kvVYOsi+eNUkrbJ/ULn/i287IBiI5waCE
	 ukG0dz+85rTlxVG9BY4arGSt38SDXbWMTnKqM+Bss/zs4RMr6nwiAGV8B/ziDMe5zITWj
	 mqX4UNL2BwlyFDX01qRiVJv6vcHxOY++seyjy9tcNGLeaMD3V19HT84rmwiPG/b3lZhLl
	 KVxVSyvQUydN/sCaCirOzdV3pOowVgqbQuE5DWc0bBj0He7l9FP+2io9flyPee9KfEphg
	 VznyymciV01cKy9TbM0iDDpCb1ORrtZbfMr1BT716GLLncYklZbutKOpEu7ccXEVRMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ewPEeGyG;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF56606A331
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 16:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CF56606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ewPEeGyG
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso4806143a91.0
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 08:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709691; x=1796314491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OG2zu+3pFucE1vcX6/TAGudL+NIy1Iy8ppAf1TtVtOE=;
        b=M2mI/PgPXubdD0ZeKshltQbEDFPIx6ZYT/xnLDxpMlUpjenSqYbuOdd0dveTmllaY6
         w7L0cAoLp9slP1+gRXvsTV6/XHLQM79AR44HUdbZthYeVyJ23EEbCLnDoWB5FBB0bClS
         r+vlh/D/ixYhBst+FVK6ho0wvp9ljgBMCq7l5ict/V6vo65EVUxZ4AQ8eOTTOUGovFvV
         1Ys5aebH5vLVRpgrJdvliqUNM4LoR5SKhl5a09/wdt5scAuMzsJHP14yvoxZ1WNBZLtb
         o2mQ5WrnY7X6JXdHkCm6Av8mdfXmK2ocjqOsM0vP1X+CYmtJ0sPtRF/yBTPW5Y9AA4Ss
         0h+Q==
X-Forwarded-Encrypted: i=1; AL+hErHFeixDyy4XGxR0GeWu7XWEIOMDjEeFfqEGojdAgMKMAyIRKxkIVtsGWFQXbO+LWwuNHjjLfmzdnWE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9iZPf9c12IPGh1o8PJfBIEBZpZDdIEpSGF+JzBzwgN+4aREegG
	5ceZlGoSINnXOsDQZ1O+O1jK9C+H0CazXk3R7Axs0J0B7JY6o1SVJCwdPhL6pKY9XjPUSB1hq0b
	FHMA1FwM1m3llx3ogONe6C2C5k2mWOu6XjG6HqC5HvU/1Pm3zPeomOCdFdVFY2zEkx4at7EOxtY
	oJXZ27mxgY34vmjN2K2n6cT4MlO0eF71mltmyNMdFdh5g88ivOzXv16/k+im3s9qVVubQ07wySM
	w28CYUp3zM0csv0IANV+Q==
X-Gm-Gg: AZFdTZd0EhAzFHSV8/EmzalUmUqGjKAqyA2lY8VWkhi6aJ+iuhLhqjNDT65xca0bNy+
	z1sodN3i7cGcSYvJwthikYKpjCabDIDQELkG0SlR8qHIYyG9PpOVNOYmDd7rmgP58cP9q+R/mdW
	UwSMKOl2GhFObyAjrmK0ZPXqmHySGVrmNaX5d+PvyerFbRJx092KCz6UFeiD+wmz0LGWOHyP2F+
	OHjwwebfdywLL/19gDVVKlG8uomEh5ssnSTcVTqxI96XUnGQq2RDQUGSRHr8DfiL0AzpRbsQM0/
	831BjzYZYxQVe4i2lls/unwcu/2GqsoHCi/Sndl1sZ9Qe0HSfN0/OQntsMbY4hEhCwMplFwh+bV
	4zM/dDxSTS1iIloGebK6DYGIVJjtwRksj7O+C5tUuWSQWmZT8Desy7oAYvwnJwC0jKtF2qpEreF
	RDe4LZYnFcfyOo5xA7XLXG+g1T8n8K0JoNHeDgSgYdFQ==
X-Received: by 2002:a17:90b:35c3:b0:3a8:c0cd:57fb with SMTP id 98e67ed59e1d1-3b41c959689mr20584493a91.42.1795709690518;
        Thu, 26 Nov 2026 08:14:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42001764esm5277196a91.4.2026.11.26.08.14.49
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:14:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949dc497896so599982085a.0
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 08:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709689; x=1796314489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OG2zu+3pFucE1vcX6/TAGudL+NIy1Iy8ppAf1TtVtOE=;
        b=ewPEeGyGAAxMz7YQcAZSt0axoXVvmYVMc/nhZYoI9m7LR3gvRotSw5GN7917o3bV5p
         jykqLQw3sDheK3qU51PUjJXNzp3lHC4FGPdMjGWTq3Yak9oyZKmRfLBwqzxLY18c8Xq/
         JhVeMcJI+6xYDgU0cxcd+ef5hMUmLv/D7vV08=
X-Forwarded-Encrypted: i=1; AL+hErE6JIRiHUjOADkgctPfi3lrh8k0lh37oDGgzPJN9so1yifvI2dTPfS+flF+E+NauEtUJ6Z7ztC/FQY=@lists.linux.dev
X-Received: by 2002:a05:620a:4012:b0:93f:228c:52fc with SMTP id af79cd13be357-949bab4d750mr3903800285a.58.1795709689021;
        Thu, 26 Nov 2026 08:14:49 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:93f:228c:52fc with SMTP id af79cd13be357-949bab4d750mr3903795785a.58.1795709688522;
        Thu, 26 Nov 2026 08:14:48 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:48 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: Re: [PATCH wireless-next v2 1/6] wifi: brcmfmac: move the interface_create definitions to fwil_types.h
Date: Thu, 26 Nov 2026 17:14:39 +0100
Message-ID: <20261126161444.2484980-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-2-dev@deq.rocks>
References: <20261125190254.176055-2-dev@deq.rocks>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 25 Nov 2026 20:02:49 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The interface_create iovar structures and flags are firmware interface
> types like the others in fwil_types.h. Move them there so code outside
> cfg80211.c can create firmware interfaces as well.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 42 ------------------
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h  | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 42 deletions(-)

You may add my acknowledgement in v3.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
