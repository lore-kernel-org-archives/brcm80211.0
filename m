Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4EC13635E
	for <brcm80211@lists.linux.dev>; Fri, 26 Sep 2025 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758888117; cv=none; b=lerVp6Iz3fi9KyHIB3Kmm/9+JhcXmy/VUhIvm46wMJ9XS8W9DZ6V0LLFQzl5Hg7qQn7glyBBIKgCHW71f/LDwS8sKS+BjW4M4Qp5STssZAdFJhGCa4tpmEw2jcYeOd7uzOBODKtAOKY40v0WIQaN63/XRXeFUmmNELy90IBROxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758888117; c=relaxed/simple;
	bh=MpyFepxaLT7pC2Nsspl7xQoGfb1CJvxK0CsEc89YWLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fvrt2+970ZzwEGGwadjNtFvxSMHlh2naP6vtrq9eiEnsPMt0+41bkJIyvFr8Z63tiB4Qr2Esjm77KJMRR1kKJx3oUQROIzu3ZNOvecS5YgdWjhheY89lhnr4pSHw8GhMjzFzd3kYuvLrmHrSt99Q1IplgNDNOf9e6SRJQOVhqbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=aGK8C0YK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="aGK8C0YK"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46de78b595dso10542395e9.1
        for <brcm80211@lists.linux.dev>; Fri, 26 Sep 2025 05:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1758888113; x=1759492913; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jT5PnBOVYefWF4N5Q+X75nicfOGFJ6TJnFIzE88eVLI=;
        b=aGK8C0YKhjd0qvd/s0U5dAuygNKE7IxYjYLJMyfxYUzxT+URgDq3/sKA7zvrIkiuuX
         fsUWTd+CUHVE+UvGIpdqdjcuDp2hYyNuA4MlXdGWuRQAQHdKi5sEA2EW4jWjG+fJRsAu
         OAi/4xxkOWJ0988F6zhwEVsLW3k3OXIOl8ApjYi+G4pEp8OlrdvknCq4hMsJrxkBkw3Y
         HJJq8f2cPz6eGzHaNVSmZSaLXv882yZukhWTEyC3WBAWzvAyuhtDGL5dvOw1QYc7m7D6
         bofimAhANS295u9d9/k1Q/kEHD7rqiCPn0Dq3lBOUICO+hFHxwSGc4ME6IdmD2fZtBOH
         rTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758888113; x=1759492913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jT5PnBOVYefWF4N5Q+X75nicfOGFJ6TJnFIzE88eVLI=;
        b=glyh8yu95u89wh2TcBJOnkOi+JUaQ49U428ERnS0U3Tc0X/AwYTDnn9DiWo37oJw4W
         iou77mngrAacSTe8q/M5hK0Qw3L0/BLEck6v2oMiRzKdWJY3DRcjsZ6mcOlSAoENkyRJ
         t2yCrhgBsWpIJ0WmbRl5WBT1QSB5geuLhgwnYvN6MHJznOqaXOHBB1rORPl2/3Klzr8i
         J7WZ2PRUZLqbEmB9kjs/Y8WCOT0nMXhO4MM3vlKzlWGFHI5wt84gzZIUfUcyonLjbRXC
         ZJ1jMWHgjXSNJVcUvIzNxaPxkOjyH7DvYvc0tW0qZ8oRIFkOjvMS93TIR4wn2+2SiSMt
         WCgw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ/rQ/XYUMg7/5YMV/Jjl68UtmgwkCSgIVBezgtD6V9VZB/7pyI/IVdElYolJrYDg3zzfNxbu5mxo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnSck4faKkzEjOTaRGEEY34KaFLcjljRSW5MdmuDMHsC+cezPH
	/e1XIO6nBLP+HjhlTMYcJtLU/UEu+dHYo+hg5aRCo5MkpvlRD4DyjrVjWLjE1KW5n2Csz5Vb9WV
	y9TUYtgM=
X-Gm-Gg: ASbGnctNPjOZmFMGlQYjSy1VVEhA+rXrRVKcY79gsMasf5rsrbRsCO0B9RXB8HUak2H
	lPEd+YRTh1H9Sc9uQPMeJ4TkMAYPQug6xrjApBgU2HpffCPI1ZDzc5djy8rpePBFWUVM3L/2eMX
	1wIUkUpiObFM92BItFqcxzM4KlzyuGxNsoldCWjmn0mFHRWRPUyStyAoJ5z9pHNXsyKlZVa7Byy
	P7HZD/D4FTbIy7i9kkcgN2sd1NuVpjcY0QBwQBXmHbmjRgxFAvv1WPaNAXXcUcKKm3mjaOtAokP
	32RF20+UiT5Ok8Bv1+pvLPb4nYZtfLdGOfF9HXVBnAFQOwNCmeR8YTvMCTa1bj8S516baAzHf5J
	iNMJWT7oHoBrCFDeKv3bz1Ix65VXmFo1awv1d3ToZgJF8GpJ2TU11BQ==
X-Google-Smtp-Source: AGHT+IHVMxAcZaCT9uCQmHmUS6tvIuZvxVDAY8a+ZbjKonhCefPZZBDIYQg4hpqzP9Anc2jhZM7jQQ==
X-Received: by 2002:a05:600c:354d:b0:46e:3f75:da49 with SMTP id 5b1f17b1804b1-46e3fb24746mr12655805e9.37.1758888113258;
        Fri, 26 Sep 2025 05:01:53 -0700 (PDT)
Received: from [192.168.108.124] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc749b8f9sm6744862f8f.50.2025.09.26.05.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 05:01:52 -0700 (PDT)
Message-ID: <f207dda9-c830-44c9-962d-fbad1e6718be@freebox.fr>
Date: Fri, 26 Sep 2025 14:01:52 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: brcmfmac: driver crash with iOS 18.6.1, potential DoS
To: Hsien Chou <s311332@gmail.com>,
 Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 brcm80211@lists.linux.dev
References: <CAE3HL_yv8t1Rkd+jLfQMkc3YrNONQp0pRFESV+v92ECf_+7Xjw@mail.gmail.com>
 <02ff0c6e-f2e5-450e-9666-3ce8b8404f86@broadcom.com>
 <CAE3HL_zPi2szh-_kPSvBcwHnYrSSYa51hwK_Kb4DqZbKAQct_w@mail.gmail.com>
Content-Language: en-US
From: Pablo MARTIN-GOMEZ <pmartin-gomez@freebox.fr>
In-Reply-To: <CAE3HL_zPi2szh-_kPSvBcwHnYrSSYa51hwK_Kb4DqZbKAQct_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2025 03:36, Hsien Chou wrote:
> Hi Arend,
>
> Attachement is the kernel .config file. Thanks for the quick response!
>
> Regards,
>
> --
> Ken Chou
>
Hi Ken,

By any chance, do you have a PCAP capture of when the problematic AQNP 
Action frame is sent? I have experienced some elusive connectivity 
issues with some Apple's devices with a ath12k-based AP, I wonder if the 
frame is malformed and could cause a problem on other drivers too.

BR,

Pablo MG


