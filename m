Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF3D3BB48
	for <brcm80211@lists.linux.dev>; Sat, 19 Jul 2025 20:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752958649; cv=none; b=ml95kwvK8zqjdssLFjZCrJzSCZDBHjsGZH0bSoyqpsAedFZgFJEeR1VBAyj9hUEZ+WepfprsWqMSMpityvXes/5kwWphlczc7ZRIXgqRY8Kov2BomVFKCI0De6A1s/AHmBD5+8CgfEO3mW56ugBjMEQqXkWeJkzW5dzUG/3MON8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752958649; c=relaxed/simple;
	bh=JFEUBLXTOcCv/4N0Mp/tCI4SIosRp/cR4vxQ6pkYVlA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=S45yHSRTzGTzyrIaJr/zj/EJvo8+/x2IXqj6IpWnH1Lv52hgO1FfGDVgZ9kTGfqD463Cg89+20JWbTVcWbbrKBXIw+b4Y2FuGczGhsDk+NCjJg/gAgEvGMeL4rR7ZSLENhYj+qtWG+yNas6XTyjJja6oJIPk9+CdDOYsFIiOOws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hScbDDD/; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hScbDDD/"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60c01f70092so5458201a12.3
        for <brcm80211@lists.linux.dev>; Sat, 19 Jul 2025 13:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752958646; x=1753563446; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1pxSQc8IFFh0/t7y5+pYbGbktW/qqWoII3Ry8ywKIxo=;
        b=hScbDDD/kdcIJs31qDRY0nnwgNqfuu4NeihEhB7ChHGBz5OAsLXTvagQ7wyCC+ruNE
         mTWJHhsr2NEYmanUDDIL4d2o3GajbAA8gyhgSxgN1m1Ap34zS7MsmTiwmq6ZJc23wJGe
         JPHEykcR2y8QO6pgF+gw0r8rBIIIqzZhK7h15ELHN4vUYdYJjSmidmPovPmjQkTaZvVf
         Yx6qSrzcHO1SV3hN5Nk3hT3EeednZGa5QlZS9CwKuhZd5wdo9DxwM451uwlyErx+fGzz
         80MSR0aJSEHYiUQo6iAGxVtxwT5PF4V+UBIaUsLuPKvun/TyLPeGmh29IWHuh2gsN19F
         dqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752958646; x=1753563446;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1pxSQc8IFFh0/t7y5+pYbGbktW/qqWoII3Ry8ywKIxo=;
        b=vMdurRIepD5ImwCEUMaUgUCR0bfVf4DxGfG717vGaxJFEMhwtXNGkT0vQnfRZ4sP75
         fASnPgjlECDwt6pO8G/VKJdpbLc8UK3SZHDfxxckZ2PRdkUlqa6wElE8kvtXxpKDGxJi
         NKbWwL5mw3UwyBefo4PxiV/mFkQOk6qmiGj6W0g26o8Y9pJuV1C92pz0XVf6J98EG8RV
         55isvhpZkyxPuk9X0OGwP+iHanTh6Q+Y7YesF78g/oM+/WdK2/8ywaOJHMP2U8EPFqRh
         vQcxjA/wO5O+7VkMKUY6z1zGmKn2K/9we7wKWhiAoSWjfyGibCBBwVquRLP7KY7hDzQV
         09mg==
X-Forwarded-Encrypted: i=1; AJvYcCU8izuQdO0HxxwMUvv1S4zcMXh/wn0MNUhaf4ckDlJjNuzoM/Sxzu98JbwF+Nww5h6RtALM90N8IJ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwE9pKr0dY0lRD/v3mSrynZ2PX5n/s3snH+ZkRvsNhq1cHzpFu/
	03yTBsde9UJgBbvU+2vVOObBRKZ7428eQHwG0/AmRvK1z0O+lUyBddp/
X-Gm-Gg: ASbGncsY6q4iXKEzEMx0l0irGfvBhkMS1+6qPDS48XrOe1gR41yPFWsnLoWi4zW8DC4
	YS9qlBS+icuve4Ia6QW2aRIHa7mF5TwvIxaaCAaop2ebJl1wlv9qGYjAmmdoY1/ArjwQwLzO8tM
	0jyTmv4U19ASLDUh64YjA0NFunsNeKtt6QwcfggChc+MbDI2Sq3eOEbC6gR6yR4qAG7VvxNUq0k
	ALi87yZNd+Bw0FhW1sFT2LDRb4dZX3kuL+/rFwy7dMIK8KWsr1vpQeALXq2ii6vw07ikr6QVgzs
	6V2L4xRgPyz1uiEirzmNLGfE0PgrxyrkK4SQTIhVZa+6950hNr1USK3qnSwZXQX6kDx5+Y7xHhk
	O4kyBIQmOsKPRXHyU8pcWseZKNO0bCH9c2kmuMqaZwa2vq8tHXoD6U5vhqfKAph7RzrCAwKbnUS
	2k7Qfns428QlJE5dds8l/LbeP1lyesHHT8uB0h6gg=
X-Google-Smtp-Source: AGHT+IHXhGO5KtDinw3HUKi8PDwr0g/iIoKLRi1pDk0QepKJRFGMapsKVykydsSE++8MamKKDvuz0g==
X-Received: by 2002:a17:906:d7df:b0:ae9:ca8f:9642 with SMTP id a640c23a62f3a-aec4fa95412mr1174178266b.15.1752958645525;
        Sat, 19 Jul 2025 13:57:25 -0700 (PDT)
Received: from ?IPV6:2a02:a466:68ed:1:7706:e3e2:69b7:ae8? (2a02-a466-68ed-1-7706-e3e2-69b7-ae8.fixed6.kpn.net. [2a02:a466:68ed:1:7706:e3e2:69b7:ae8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca3001esm367235966b.89.2025.07.19.13.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Jul 2025 13:57:25 -0700 (PDT)
Message-ID: <dc05e447-06a1-4865-8252-c4a0710d6da9@gmail.com>
Date: Sat, 19 Jul 2025 22:57:24 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ferry Toth <fntoth@gmail.com>
Subject: brcmfmac: Can not completely turn off AP (BCM43340/2)
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20250407042028.1481-1-vulab@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <20250407042028.1481-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I have an Intel Edison board with BCM43340/2.

I am currently running 6.12.39-edison-acpi-preempt-rt which is mostly 
mainline with a Yocto 5.0.11 (scarthgap) user space.

When I turn on tethering (using connman) it seems to be working fine.

But when I turn off tethering, connman seems to be believe it is off, 
but I can still see the AP with my phone.

After this wifi is dead (can not scan, connect, tether on again, 
nothing) and connman believes wifi is not supported. The only way to get 
it working after this is reboot.

While AP is up I do see in the logs:

Jul 19 22:06:34 yuna kernel: brcmfmac: brcmf_fil_cmd_data Firmware 
error: BCME_UNSUPPORTED (-23)
Jul 19 22:06:34 yuna kernel: brcmfmac: brcmf_configure_arp_nd_offload 
failed to configure (0) ND offload err = -52

But maybe more importantly when tearing down I see:
...
Jul 19 22:07:23 yuna kernel: brcmfmac mmc2:0001:1 wlan0: left 
allmulticast mode
Jul 19 22:07:23 yuna kernel: brcmfmac mmc2:0001:1 wlan0: left 
promiscuous mode
...
Jul 19 22:07:23 yuna kernel: brcmfmac: brcmf_configure_arp_nd_offload 
successfully configured (1) ARP offload to 0x9
Jul 19 22:07:23 yuna kernel: brcmfmac: brcmf_fil_iovar_data_set ifidx=0, 
name=ndoe, len=4
...
Jul 19 22:07:23 yuna kernel: brcmfmac: brcmf_fil_cmd_data Firmware 
error: BCME_UNSUPPORTED (-23)
Jul 19 22:07:23 yuna kernel: brcmfmac: brcmf_configure_arp_nd_offload 
failed to configure (1) ND offload err = -52
...

This has regressed from some older kernels (it used to work fine) , but 
I don't know exactly when, since I hadn't been testing AP for a while.

Any ideas are welcome to debug this. Or any patches to try, I can build 
on current kernel (6.16-rc6) easily and capture logs.

Currently I am using:
echo 0x1006 > /sys/module/brcmfmac/parameters/debug
journalctl -k | grep -e brcm -e "000000" -e ieee > debug.log

Thanks
Ferry
