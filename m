Received: from mail-ua1-f97.google.com (mail-ua1-f97.google.com [209.85.222.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968F2445AD7
	for <brcm80211@lists.linux.dev>; Wed, 29 Jul 2026 09:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318510; cv=none; b=RrrfyBYi8DLd7X0o3Q785yPHM3Pog6UiGPKwt/MbCPkgpWf0WUGlAWjmo0f1V1xbCAtR68xAbDj4AHYIG8rShn2yxsb9OGtw0IWyrb/l1fGZXVSr1OepmKuik81Sl9MD2S165lP0hQOv/YDzkarggF+Hev8GgaERqqSccwb5jrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318510; c=relaxed/simple;
	bh=H1cxms0cuojPr7jUeGLLOn3L/QZApPoeQCFr1rIY4pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQQnMpP3mVJ1QGzYJ9Kv/SDFCPd7+PVlLZBq1ogNjwSqdbWt5gmgsKbEIZWUkgAWxOUD3B8479gGGiscaXoVwqvfYvBwBOhAuj0S8Tdw4A5WIaQRVWVKTF5SEIlRFOAjOu1zixryLUsUPz/k46/+NcXQ9BS6l5MMjqzNEvSfGj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QgQNSprO; arc=none smtp.client-ip=209.85.222.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QgQNSprO"
Received: by mail-ua1-f97.google.com with SMTP id a1e0cc1a2514c-977bc1cfc6fso82409241.0
        for <brcm80211@lists.linux.dev>; Wed, 29 Jul 2026 02:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785318507; x=1785923307;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=q+GPA/rLhc1S1DZlerpKKjvy5ROXqBkGhbeqa7Tzmk0=;
        b=qwrbg1acEdawOl3OlEqb7WW8cHGETsYrlPZrysCujE2hkQJxWhPaIvsgkdDPPkdS9T
         Q+D8XDQU8T99qHUvSpEI/yQWnlULKJWcdfpZ5qJvETN04CBE1lQRBMlpWLfNC/r2Lcw5
         I5GMu16d5kOcn1dWTSGpYhhscP3DVfyJquoIbp2EZzQCWXedRy6Stv5Cxc5o4kNqsD9Z
         m9Ue4FojMaC/IQj4Ar9V4Z2EmgcnhvTqWiuRg+4Xfp2irt2JduXDG3MnUxk1XFojzszF
         7Wv8uJP8SGJGip6c4K7pH+bHXBY8XK5TA4q1m9/26uWEZCl4w/b/HcbdM3NfIf5E663i
         V6EQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVP5Ggu9VrH3gOSirXUY+7eHbIXgwHjUTDCLId//4+aGLq3mjGUkEzLBQi8dGZn6LClYyTWg1IafU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtRTETPa0TcQrWXqTs6e6WmH0JC+w78wL7G9gz2wnxck11N8bP
	8NpyUxI0dfSEApZna34j/56XzA9KPUTgwaZ0BVYYR7tCY24XcfSDjDkA8hS4dahRzIkvLPjEv/t
	eWDcmOyYiem7KbIBi77WIvP5x3u7EXoo82yIHW6oP8BRh9srzvdp7cKBrjLey0XWGSzGaHm4Xai
	R3DV+6T3Z/wZ673E71erEvtCazpr1RqY3umHYvDABs6zHYOKZDrCzTNbBr6AI/pM4l+qQjsHl1O
	9Fv+9SKnV04pyGMSi0OKg==
X-Gm-Gg: AR+sD12gxtjXnCdPweutG/cdXqdLA0pfNGKNNAYZ982KQ6ZlUO1waDlQptmG6mRzfa5
	YlBJwMl1v7RdUTXxhccelizdFwg227s9QLk5vdhGNuxMqQmsqtJzpmB12uD2wwMvCnoqP2CNkx9
	IbmJ2omhQmLiDizLkIcycWXeliO6HpzUNZF9ucNvFxJtgLkHF+9m5nQNXroy6Wa1LMr7tp6z7AV
	vG+cpYeb9cRylXbiNH0ovjiMYvcfFjdTHyLDGg0yjbI+d6/6yMCCWoeD0Cqf+RChZBlnSjYjFU5
	wnriLSOZuL7FFdfcgNJ0Vb6aXwOars32H21oXWTvHo56PSRwFz4u46Fg2Wn/Ozru1LXnNajbJGf
	lLuVhpJg7JrKjxv35ua3yqIv51fVDoDBUkyOvxPTVxsPM9n36Drc7L51yqq6MMi1FO0cmm2Fe7h
	VGW6iA5mj458d4rmeUHLqx78no8sZsAlHpiTJxGew=
X-Received: by 2002:a05:6102:8085:b0:745:31e9:f3d9 with SMTP id ada2fe7eead31-7549f35079amr2673775137.1.1785318507023;
        Wed, 29 Jul 2026 02:48:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-755a9aa20a2sm173467137.22.2026.07.29.02.48.25
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:48:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f0c46bfb6dso14437666d6.1
        for <brcm80211@lists.linux.dev>; Wed, 29 Jul 2026 02:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785318505; x=1785923305; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q+GPA/rLhc1S1DZlerpKKjvy5ROXqBkGhbeqa7Tzmk0=;
        b=QgQNSprOIrtsIvzxK3Us6kLKmM1QBOfJBWZye/7FnIUGrmK8ivGVPJXoLWftZCoXmB
         P8vY7gwQcMay41hiw941y1PdDU/C17i90oJWprZrrwBBlfsuxNtOoGHNVWS0ai4YVKdZ
         nnm+ymJl4toFVBg/7Ye/wkuw70B9WMcvc4+9U=
X-Forwarded-Encrypted: i=1; AHgh+Ro25WyZmAlA7AlLxew4/CFGClKSDtg5j4Ly0NbAB4xywxyEudETMu91Niz/q1rGtm7Sh2vOZNuGGwY=@lists.linux.dev
X-Received: by 2002:a05:6214:29eb:b0:8fd:6e32:2bfb with SMTP id 6a1803df08f44-90817376d39mr59183276d6.60.1785318505528;
        Wed, 29 Jul 2026 02:48:25 -0700 (PDT)
X-Received: by 2002:a05:6214:29eb:b0:8fd:6e32:2bfb with SMTP id 6a1803df08f44-90817376d39mr59183186d6.60.1785318505096;
        Wed, 29 Jul 2026 02:48:25 -0700 (PDT)
Received: from [10.176.3.215] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dc496f7sm20496196d6.3.2026.07.29.02.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:48:24 -0700 (PDT)
Message-ID: <5cf57b2d-2bcc-481c-87bf-3a034d5f99be@broadcom.com>
Date: Wed, 29 Jul 2026 11:48:22 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: configure SAE PWE method for external SAE
 AP
To: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20260729053408.13715-1-bogdan.nicolae@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260729053408.13715-1-bogdan.nicolae@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 29/07/2026 07:34, Bogdan Nicolae wrote:
> When bringing up a WPA3-SAE SoftAP with external (user space) SAE, the
> driver never told the firmware which SAE Password Element (PWE) method to
> accept. The firmware was observed to corrupt its heap over time due to
> this omission, leading to firmware trap (data abort in heap allocator).
> 
> Parse the beacon IEs on start_ap() and set the extsae_pwe iovar
> accordingly: 2 when the RSNX IE advertises H2E, 1 when an H2E-only
> membership selector is present, 0 otherwise. This matches the behaviour
> of the upstream/vendor driver and only applies to SAE-capable APs when
> external SAE is supported.

This makes sense, but may I ask what device do you have? Suspect it is a 
Cypress/Infineon chip. I could not find the iovar in our (Broadcom bca) 
code base so I suspect it is vendor specific.

Regards,
Arend
