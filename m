Received: from mail-pf1-f227.google.com (mail-pf1-f227.google.com [209.85.210.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F6A343D91
	for <brcm80211@lists.linux.dev>; Sat, 22 Aug 2026 18:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787423066; cv=none; b=E5KgiGfoNA57ES0HPFSh8Pw1maZrUsADFi9dPCjAzCnABKwNtN5P8/oMV8cQrXposAYI9PvlJ21CJM4JBZUO+XIGhalQ0To519Sas/zyhsu7QEWnwIrMg6kez6f3vzyj0I+Rmcv4fmNi6Y3Euv99OtozBFHktO46wO+4tXjsL28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787423066; c=relaxed/simple;
	bh=oY5nYB7gBY6C8eCXHKb+BZy4cqHwJbtML45bzXFEKOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNR00TNtwcora08Ip671CcwgMzCzfzIt7yP4BvxgTt9emn150B2lPlOZ/fyixpBo2sTkzgC3S90917kmFbwKsCEUQdYaRGs4Oe5CclKS+2Z5GKGoNX4MgIechltRGefbcWikh1kBQXkmhtaes3Cnqk80C+F4Vwek6O1LuVYa8jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JJMStD3s; arc=none smtp.client-ip=209.85.210.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JJMStD3s"
Received: by mail-pf1-f227.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so1769300b3a.0
        for <brcm80211@lists.linux.dev>; Sat, 22 Aug 2026 11:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787423064; x=1788027864;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=r5+8Ud1cCOK+HFvXxozibZFG1qXAcRUxAkWSfbO6NkQ=;
        b=PibPT/VCHFvvSZVO4Cl6FBJBIJQdr8wZQls7AQPd8HND2R6QLjuwR68+oEjJ71P9zi
         9Dt/PiCYfKRLZt+ZvxkjSwExcE/bZgX9M6E4sQ61bi8q7S/Fl/H5ef8M3J6cLxxCrCBX
         7Ym7D53apNfiZdMV1xzW7NCxMS1LA5aw6G7t706HWl5ozbqGu5VYIYthroWTPRIPVwVB
         FYWDdjgNuTp7G5QXI8LSKlGtDqJD5PQqFljZMHGGHmu8re4ifsfFnmUmDp0oiZEQbpYq
         f99gcwQvrQ2+6GzVSzk6Yf4JEtvXqlw+E9ylc5Wm4fVHP0wQ0a/juDxbzUqSqtZhPmYJ
         uwpw==
X-Forwarded-Encrypted: i=1; AHgh+RqlGdRXBVgzFndVpuWZuj9SmK0ZCg+0ItK6hJ4QUqaLzNg8q4xxuRwvUGHiIZNOxuSnVMso5Iv/g5s=@lists.linux.dev
X-Gm-Message-State: AFuF++mWSbbN0JmKJCU/a8S9hn3JAGR371KTYTEmG3dsw0GpoWuWHnBa
	LIp9S3WTNsBVlqECoYpn0nEKKeXfz8zmNpNNHF+KDT3+ubjtz2jnp1BqEVbcs+nRB/Z2jOFGBHM
	XDBT65QBi5j/gn/ftL2d4SvhPNz5NjFUP8HCLY+PfA0NQVTC626LgHxsG/+6GW4kLe5/rqVHvdy
	9/4QYd5UTSg5pi6J4gVBISu5SxGi09r5rGwsRd39EDC7arSelg9SbO66qJ9zSainHAeWyqIPpo5
	ZkBrEC7IbQMvhdvbw8PcA==
X-Gm-Gg: AR+sD11bkeIui8UNTOCKh1eQ6ZE2t19pGSrmrn5Ne1tSRxjjMbXc2JAMsntiK2EK99m
	ArJT4H6Ou+OFI1Oce/jPM2yaefhbsM1MZOUxUeNgX+nKgskU1n2W4Zvk9axwygN9n1LuUmpqjX6
	fQqYTVdKh7yc3s6pzsZObCUsXiejRmhCnPjKByi6U5fXPnHOtyU5yR92fiHHU4lwuLRIWffPcxW
	I5I02Ne6yLZjB/URjuu8RKSOvkk+UXXpr5E9IjQS3qYy+WBerR7NLZyYUDtLs3iI0HSqwd4smal
	X7dQZRUwoGK0RePaCL05ehWzWCvECg8ZHqexzYhOyndEGUlT3y4Q1f8AH1sCLTgu16LR0N2YLt5
	YvdVnM/aQsIYv+yBQa8lT+YW+Cmupr6934HfGpAD9tWHdhkrcnpBGMEQ8kKol7HU10Z27VDVlbV
	9Qf70oXl0nFQgKDsMcHo0JtmxW9rgfrHf7+E11Iag=
X-Received: by 2002:a05:6a00:2e98:b0:84f:b01d:3693 with SMTP id d2e1a72fcca58-8520be923f2mr11199824b3a.15.1787423064438;
        Sat, 22 Aug 2026 11:24:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8521099ee35sm1069083b3a.8.2026.08.22.11.24.23
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Aug 2026 11:24:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d55d8cd938so39272175ad.1
        for <brcm80211@lists.linux.dev>; Sat, 22 Aug 2026 11:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787423062; x=1788027862; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5+8Ud1cCOK+HFvXxozibZFG1qXAcRUxAkWSfbO6NkQ=;
        b=JJMStD3s0fg7DvnpcmR54LgDMP6WSa1FRiVmZSpCnYV7QePlccdMb3Ch3m8Qy/XDDi
         YHvD27VrQ3/wnVFd4tuVzG6ISxdhTJpCCA6S4hHtDLcIOTiP7ms3yj+Pla7lCXfdAdBI
         vKPJ7rHyNuLFgKcOO/gQTi25Uxxb5IQrhw4c4=
X-Forwarded-Encrypted: i=1; AHgh+RqV9s8r4uH9Wuw75mrerwKJTzM+dWJCk292uUZpYgUoJaxNTlL7ERsmT5gVAIMKt+7XtYdUXGr/NSM=@lists.linux.dev
X-Received: by 2002:a17:903:b8c:b0:2cc:d6de:d597 with SMTP id d9443c01a7336-2d670bb70d2mr140827525ad.7.1787423062462;
        Sat, 22 Aug 2026 11:24:22 -0700 (PDT)
X-Received: by 2002:a17:903:b8c:b0:2cc:d6de:d597 with SMTP id d9443c01a7336-2d670bb70d2mr140826885ad.7.1787423062030;
        Sat, 22 Aug 2026 11:24:22 -0700 (PDT)
Received: from [10.229.42.78] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923f2c0sm13512614eec.30.2026.08.22.11.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2026 11:24:21 -0700 (PDT)
Message-ID: <71261493-e974-4f5c-a453-b4c2e449baf5@broadcom.com>
Date: Sat, 22 Aug 2026 20:24:17 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] brcmfmac: add FT/OKC roaming offload support
To: Jason Huang <Jason.Huang2@infineon.com>, linux-wireless@vger.kernel.org
Cc: johannes.berg@intel.com, johannes@sipsolutions.net,
 hsin-hung.li@cypress.com, linux-kernel@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 wlan-kernel-dev-list@infineon.com, jeff.johnson@oss.qualcomm.com,
 Carella Chen <carella.chen@infineon.com>
References: <20260821-upstream-wireless-next-main-jason-11r-support-v1-v5-0-eeab4fda0f31@infineon.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260821-upstream-wireless-next-main-jason-11r-support-v1-v5-0-eeab4fda0f31@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 21/08/2026 09:56, Jason Huang wrote:
> From: Carella Chen <carella.chen@infineon.com>
> 
> This series adds the cfg80211/nl80211 and brcmfmac pieces needed to
> support firmware-assisted FT/OKC roaming offload.
> 
> Patch 1 adds an nl80211 extended feature bit so drivers can advertise
> roaming PMK programming support without claiming full 802.1X 4-way
> handshake offload. The brcmfmac patches then detect firmware FBT/OKC
> capabilities, keep roaming-offload connections in a firmware-supplicant
> profile state, program PMK material for FT/OKC roaming, report port
> authorization after offloaded roaming, and advertise the new capability
> when firmware support is present.
> 
> Changes in v5:
> - Reworked nl80211_set_pmk() to avoid the 80-column checkpatch warning
>    on the 4-way handshake extended-feature check.
> - Added kernel-doc for the brcmfmac OKC profile state added by the PMK
>    programming patch.
> - Normalized Assisted-by trailers to the checkpatch-accepted
>    AGENT_NAME:MODEL_VERSION format.
> - Added Johannes and the wireless/brcm80211 lists to the cover letter
>    Cc list for the nl80211 and brcmfmac changes.

Hi Jason,

Thanks for the follow-up, but looks like it happened again. Missing 
patch 5/5 as happened with v3 series.

Regards,
Arend

