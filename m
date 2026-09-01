Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327FA471D0B
	for <brcm80211@lists.linux.dev>; Tue,  1 Sep 2026 08:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252974; cv=none; b=edmOElZsJH4Rx6tLvjBmmX9KzbekMQf3ZtFs2O/XKHRZaKs/w6zdybDvMWagD5ZqZRzZNbfMQCTCNtgfy2ePWgA1Zzty1duxIVU+rZMg6/Mnj/3MqurTDBCkhv5+u1bvkyPrI35Lqt/Fd6jYeq7m0jFtH60nV2LhoUX3CZ2DgA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252974; c=relaxed/simple;
	bh=HKyQHdR5ynNMus3ZIXulcMT4jzgy3T8hMGmMkl2nc8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d95V4tyrQo9MOlHrb1mGKNb6f/tzfXnagWD+wSBaszIMC987x+LLDzth4gVM07XMgzUhdrMhaqiH5IkjVDOBgBqw19Yts2r5Piajn97e3XnH0Jzjoga7MlGMKP406sqsO6gBxAXOcDQsyOrPiU7L2Zmj3HkGGWIZjW6nTMHTWX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Kw/tz2tL; arc=none smtp.client-ip=209.85.219.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Kw/tz2tL"
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-90ce3971a86so34561516d6.0
        for <brcm80211@lists.linux.dev>; Tue, 01 Sep 2026 01:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252972; x=1788857772;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=E+KYz0np7Sxg5cuxvo6xZsJdgBW3ZsGYJ2wUIRvt5rQ=;
        b=jDlLSZqCKq01udqcIcLVZg5WrsB3bOFDR8VasziJYEweTrZlBKXQQYmBYZNh49YYfm
         3bDGcS7xX8yZvum874u4YeO3tOjUitCEK5ohPHZqaidcvWrW5KpIZ8VIwJZ71lm8lH6b
         7pt+22PvxjbzYFAyqI/GIc0XwYoRF/TuijY2anAvNqb8DFD6q7xsG9UcC860lKqVOLs1
         j9MWmFfkRHuWuZgCxaEBHpEDFB0D2FRBMNz+TBZ2wtsdx6jytzlnft9aPBOTZFdyRU17
         A+ifcHnfe30iMRlz4JVdzdSuJ0GSYC94JQNfd0SUmakYEUsmZyAJqY1WN+Pm8pqmDmJT
         hu1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrafA7iMKY9ZPF+ytVPoyyAieEVsWSNBYjixvH4Z0AW4rOBiHT/PjroH51KNskSlHpwwOz00ZyjeZ8=@lists.linux.dev
X-Gm-Message-State: AFuF++ln32fg/9eJPKFLdjcUf6cQqJVmy7w5OhPqIOjaFb5k4bBZW+8h
	8Fi7FoqKODnErHyWSVkXdKupy70MSY8yEaqSLaNucagIJ1bB152lvSO0c37kS/L+8/yABgoXpM9
	gB6XFF9WUojB/bsv/pAZnBYMq2CPMjcbNcfe/GeWqGEGfK6emchESwxGOtW7IDhBAX2QUjQJuUx
	oGN0zVXNd1+VZzKxuCNmQQAt5Fu3L7aj17iD7V7Spy0aiFPRGN+a7bJ+RleWIDWu5dsJYCYvvsc
	WVIXCgX48DRiNJV97vAUg==
X-Gm-Gg: AR+sD13526ERo9DAe2bbTqxnnZ9o/kOa1T7qpchQxDLetHpEZI/WLrklYlcxvdTW9Nw
	gHeyJTQozOOIQkJUWiCn0p412wCcGXCyyHMth6GyqoSjqUWneOfbdW8NDyu2w4be0lPgeZDgGaN
	0HCbSpjecQFKwjlEVnbI+nXUn/v7HpBKJN2zbmARkzTKJ6uWvw+EZcHiEJeLG9hNRA4XiTqT1oj
	9mjILF5QuEH1NBRvqEIKE9qLplHx0J6QMKSROiBh76EaQtuCH5fivtUl7ctO7FmiErHm1r+/fYt
	Rxz+p3sKwjVmQGvegJXGcD1WZqAQbD4cmknSPPcwtl6K3hZClZL/JVvyuhaIir89JQRRWpp7W3/
	5e1MT1S+8i7T0mCZdpin1pGYbLhjRLsPDwvJFNuAZlfb4QhyXhq1F4Pqs8edUBDmIQRmB71to5a
	S6XVQZtSljeY6MkcQIB14w26VfewzRCwst6xQklZ8=
X-Received: by 2002:a05:620a:440e:b0:939:34c6:a333 with SMTP id af79cd13be357-93948135358mr826644285a.40.1788252971672;
        Tue, 01 Sep 2026 01:56:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-939175ece70sm110117185a.7.2026.09.01.01.56.09
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:56:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fc3bff8bdso78163451cf.3
        for <brcm80211@lists.linux.dev>; Tue, 01 Sep 2026 01:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788252969; x=1788857769; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+KYz0np7Sxg5cuxvo6xZsJdgBW3ZsGYJ2wUIRvt5rQ=;
        b=Kw/tz2tLQmQRlDLmKIJERCL+XslMSU7pRsjF3YxmGTjqJUkdGZpeE31vn8a7mvrJPu
         VRuW6w3F9l4+8517XDchYjUBosWpUKM2Jrcsjv5a4z+fpVZT25X0bsXrlsX8AhApOTt8
         HrknUhJatsPIzUs8WqflxWBssBfng4/KmYMp0=
X-Forwarded-Encrypted: i=1; AHgh+Rr1gCSDecIREsZrP5vlVIzMwQIXRDya+/BL+rq4IVoaIZSoOIARrFq7oRtKQ8f7CzkmkD0PzbeDkU8=@lists.linux.dev
X-Received: by 2002:ac8:5cd1:0:b0:528:3471:937f with SMTP id d75a77b69052e-53021ce5310mr90233261cf.29.1788252969516;
        Tue, 01 Sep 2026 01:56:09 -0700 (PDT)
X-Received: by 2002:ac8:5cd1:0:b0:528:3471:937f with SMTP id d75a77b69052e-53021ce5310mr90232781cf.29.1788252968989;
        Tue, 01 Sep 2026 01:56:08 -0700 (PDT)
Received: from [10.176.5.153] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52ff6f363fasm74787291cf.16.2026.09.01.01.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:56:08 -0700 (PDT)
Message-ID: <02c6f660-68f7-488b-a600-279e3a7f272e@broadcom.com>
Date: Tue, 1 Sep 2026 10:56:05 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] wifi: nl80211: add roam offload extended feature
To: HungTsung Huang <Jason.Huang2@infineon.com>
Cc: linux-wireless@vger.kernel.org, johannes.berg@intel.com,
 johannes@sipsolutions.net, hsin-hung.li@cypress.com,
 linux-kernel@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, wlan-kernel-dev-list@infineon.com,
 jeff.johnson@oss.qualcomm.com, Carella Chen <carella.chen@infineon.com>
References: <20260821-upstream-wireless-next-main-jason-11r-support-v1-v5-0-eeab4fda0f31@infineon.com>
 <20260821-upstream-wireless-next-main-jason-11r-support-v1-v5-1-eeab4fda0f31@infineon.com>
 <382c3dbb-ff32-4e62-9b79-c6e4cc6273ef@broadcom.com>
 <8a866e2b-8802-4a8e-8421-2732da5f5c8f@broadcom.com>
 <20260901071424.GA1876155@ISCN5CG5251XQT.infineon.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260901071424.GA1876155@ISCN5CG5251XQT.infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 01/09/2026 09:14, HungTsung Huang wrote:
> Hi Arend,
> 
>> Actually there is a checkpatch warning that line with the STA_1X check
>> is 82 characters. So my suggestion please make it FAST_ROAMING instead
>> of ROAM_OFFLOAD and swap the two checks to fix the checkpatch warning.
>>
> Thank you for your suggestion. We will rename it to NL80211_EXT_FEATURE_FAST_ROAM_OFFLOAD.
> The name reflects that userspace offloads fast-roaming handling to the driver/firmware,
> and it covers both FT and OKC. We will also reorder the checks to avoid the line-length warning.
As this is indicating a driver feature the "_OFFLOAD" part is implied. 
At least that is how I look at it. With the 80 char limit the long name 
can be a drag in places.

Regards,
Arend
