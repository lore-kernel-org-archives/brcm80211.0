Received: from mail-il1-f227.google.com (mail-il1-f227.google.com [209.85.166.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3FD315D5C
	for <brcm80211@lists.linux.dev>; Thu, 25 Sep 2025 18:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758824958; cv=none; b=I3uyOquuAo2whbuOERSyPyK4+lV8lTCZ2AjrD2JN9UM4eimGcCtE6oOj+pY7nYLa9wCcfQ1abN8OidpoDkCTZvMvVSwmv1eRE48ivBlWWh5IduEA4T3H/uxwAAhxgIgwYVdzyLHymP8lPyhhkOo741AIcKZGTcKGygeoqgRmlis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758824958; c=relaxed/simple;
	bh=pBO/UX4J7C0KI04B26XSe7hPoe9OX9Q+92VaUGVxbJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RAluWM7oeeNk0OT8QOQjFHM0QgQG1yb4s2+ATyjRIhjMZ7ZITA45b9IkT0/D13tRYIqz1HYObnNTKdFL7X+wdbSvLTp5l3Iy0bgg6BG8aKMmPawB7hI8+mVbHCeDWIRTShzTR7FGIWdf7g6UtfZZobLjJK1bNYSEKW7nAbV30QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HlbhaeOJ; arc=none smtp.client-ip=209.85.166.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HlbhaeOJ"
Received: by mail-il1-f227.google.com with SMTP id e9e14a558f8ab-4248c9a64f7so7259215ab.0
        for <brcm80211@lists.linux.dev>; Thu, 25 Sep 2025 11:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758824955; x=1759429755;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9mUkWMYiaFyyO8vrDokgAXf/iLB3jaofepgCpBek4g=;
        b=dacsNwiO57FwhRk0VF8EseQYRbIYpWPSZ6ssUcSdyQxdve0E2Ug/LPPF3tcdkqIwGj
         Tuaj5ZxPCEMoT5noTyoyh6nf78+sdKQCNF3CU3tLzxb8DYGGKk/N8QUf8E21hIEl/cUY
         OplB3b0MUBSqrU716ATlWCeLQbpfhTmQEAszt9mCFqn1bylA83YZm2ZThCIEYrlmdIUn
         lwkCKtnVTwr+T3EbekB+hE1uudq1IBGo7L2EUZ6l7ZznltwVypjTT3BVitJ2OZe+OjZG
         x+NHKqK69dCPF2lp7s316nxmG///KZ6DCaekC/cHjdnPfS4Wafhy1eAm7kwEqwDem3xC
         +x7w==
X-Forwarded-Encrypted: i=1; AJvYcCXkC+4glBZQ3aOJ8Kj/7Ek8oU2Ov8H9pvbOoBg0ER8kgogqjy6L6M+ypCXGr139WPHAVqr5PUlnipk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRT4y86XfF57eSLZNTKZJalPwp6tEQuMxCQiAtvTMP3K7uTHmO
	px2nxyInZDaa1PSi/+TZXzCeJEh+/CaE2e8/nhMiVvd3Fs2EL5a+yyKKvftHItU6lQReV9woD5P
	C20QpEWMU17mtXhITyHJcYiwXlD9iSfJiXV/pCPj4sMYLljfwcgHK/+uKKFX2Bf/MQb289PVV85
	HMRxvukYOTb5NXKUMrR4w/QcqnYl0bsQ8cEVb5X/ay1IJM9SVnzHbjc5poe+D5hTX1VnB4xcBwE
	+TgLaKy/JqR/iF3RsxENA==
X-Gm-Gg: ASbGncvQnjSaKZymsHpacIJ/+UYHnv2O+Ssr3wMsMPRy/Ix64obF+D0vAlVcOQhrn9R
	ruZhvQ0GU7vf00M4ZyETTIFYJLf56tteqt5K708+eucoYvY+cfxdNkZTQjY3i8icOI++MWUAmCk
	IVTghb0pBHGyz2mUUrzrqNEtCVUgg/rI4/7fWfgKZWMIy+C4ehIkLqW6NTtj0NkBxA68iuv1Ozu
	Ye/ysPiM4tryrAYw+NsHwNjN7Q2SFv3KAa1DgVLMzHTJqhtcnQhKW+qde7KmD9iPXxVYECnpi1P
	TomP16iJBpSW099N/EL1yAH7WuoJCZi/j7gyFLMdzOIUcdnD60TEGowiSzmAZPJk+7l08y9KmfG
	30nqcOY/oGHnVfw3+7bp8kL5wQR+55Tb9l/12OVL280JYNKUz+Ihxkk7BNF+KRrKCB5nBrPJ1K2
	QjBxcTjQ==
X-Google-Smtp-Source: AGHT+IEkGjSiTiYCzp6dEKHLn2ufCYK5XnZsrDpe4tzMx4Y/hNNaOz8KjLtQ104E3Aw1SvUO73uUmVUar4Fp
X-Received: by 2002:a05:6e02:b26:b0:425:51dc:5b6c with SMTP id e9e14a558f8ab-425c31d86d3mr42905755ab.13.1758824952987;
        Thu, 25 Sep 2025 11:29:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-425c02657fbsm1815115ab.42.2025.09.25.11.29.11
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Sep 2025 11:29:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b353cefb829so101560366b.1
        for <brcm80211@lists.linux.dev>; Thu, 25 Sep 2025 11:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1758824950; x=1759429750; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P9mUkWMYiaFyyO8vrDokgAXf/iLB3jaofepgCpBek4g=;
        b=HlbhaeOJNDEt/iFkSBDm6eGzX/CNt/mvy6o/LEPAGn5QMUpubR/upDCwShI9Z46D/O
         RsheOiIliGZT1F3K+ZtlMQbynLwahdVyP8p2HwZEZJmK4pQVGm99OfSwbEnvVe+Jn/fO
         w8Yt+rxHtXjKjfyWdbbug0uOoRsrTEjyCeFMo=
X-Forwarded-Encrypted: i=1; AJvYcCXXQZ7Id4zxRLs9XNneEKBTH4erdMFT7wsTgIn5VHJ/wL1naqbKVvf6f9jLEuSMjIyywg67ySf8Xoo=@lists.linux.dev
X-Received: by 2002:a17:907:908c:b0:b36:f77e:15d0 with SMTP id a640c23a62f3a-b36f77e2046mr120543966b.37.1758824950253;
        Thu, 25 Sep 2025 11:29:10 -0700 (PDT)
X-Received: by 2002:a17:907:908c:b0:b36:f77e:15d0 with SMTP id a640c23a62f3a-b36f77e2046mr120543066b.37.1758824949890;
        Thu, 25 Sep 2025 11:29:09 -0700 (PDT)
Received: from [192.168.178.137] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d155asm220768766b.6.2025.09.25.11.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 11:29:09 -0700 (PDT)
Message-ID: <1122cfba-0735-4392-accb-ed42c5b3bf6a@broadcom.com>
Date: Thu, 25 Sep 2025 20:29:08 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hostapd Kernel Crashes with IOS
To: Chris Spargo <chris@streetlogic.pro>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "brcm80211@lists.linux.dev" <brcm80211@lists.linux.dev>,
 "brcm80211-dev-list.pdl@broadcom.com" <brcm80211-dev-list.pdl@broadcom.com>
Cc: Jonah Finkelstein <jonah@streetlogic.pro>,
 Parker Borneman <parker@streetlogic.pro>
References: <MW2PR02MB3674333A04868446C75C39EDB51CA@MW2PR02MB3674.namprd02.prod.outlook.com>
 <1997f6d2b48.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <MW2PR02MB36742154B795D5FBCB77C394B51FA@MW2PR02MB3674.namprd02.prod.outlook.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <MW2PR02MB36742154B795D5FBCB77C394B51FA@MW2PR02MB3674.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/25/2025 3:36 PM, Chris Spargo wrote:
> It appears that user was also testing with the Pixel7 (mentioned in the 
> ticket).
> 
> Our experience has been both the little circled information icon on 
> iphone triggers this, as well as simply joining the network then leaving 
> it.  It’s been a bit of a diagnostic frenzy here yesterday, so I need to 
> slow down and understand if those are both the same failure, or 
> different overruns that cause fundamentally the same crash.
> 
> I will pull together cleaner examples of both crashes.  Should I attach 
> them to the github ticket or forward directly here?

Either way works for me although I have a slight preference for using 
the mailing lists.

Regards,
Arend
