Received: from mail-io1-f98.google.com (mail-io1-f98.google.com [209.85.166.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1960C21254D
	for <brcm80211@lists.linux.dev>; Sun, 12 Oct 2025 06:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760249672; cv=none; b=buzvIu1rBt1wlWjKZjcssSijSQfLw+76GClK/OLa084cwZFoIRfLFknaveq0qsVAQ/Msq8/QurOYEAudc8KVTUo22F7jZ2dUW3IhVD9sFUQkr/zbBJJ+qPAEQ/f4JPU9L4GrY3GGxLteE69QwympSVbgJ9fm/5UlS5d4EROzH5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760249672; c=relaxed/simple;
	bh=tS3cPqrsNniI1F+/oXTJJhMpBMNA+nhxepBmGReHy9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJXj07lI7xWEgxptN5CvMgkJg0NoHpfDqhEaNcYUliZh8jbn5AUUNTUK324YvZBnbw1VK8ctpxS8l4wSrw/z6i4DBNNN0BabMNGfbQXis7PihlbdZnU7HYZTED1Ui/DNEs/N0oEyHPciAmOO4qu+othOPZeBCaCozsVBiKE10eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=C0EVMXcv; arc=none smtp.client-ip=209.85.166.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="C0EVMXcv"
Received: by mail-io1-f98.google.com with SMTP id ca18e2360f4ac-9379a062ca8so123298639f.2
        for <brcm80211@lists.linux.dev>; Sat, 11 Oct 2025 23:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760249670; x=1760854470;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEXjSsixXadxlJPIE/eWGIdDbJPv4Fh48J/bx1MUfAk=;
        b=StUa41IXHQ+Ks7zpIBPgPqA37bFWZrD1ACmlh0t2ZBQhK6MSyzAo/uSn7lbj+Wr+jH
         YPUDLs+KfWu9n5blEJjWWTeYXnGl5DvxLc5LkktgdigNYJVy5vKMQuHWqs2Ct/a+20GN
         6WU6qc9Qg9bBwPfjt+Rfk4dnbhZ7kwn3XAUSagyThkJSUZTh0gwZ4PSsAq+RNVhJe+N+
         61vl+MRVuIIVrF8rQ84Hu6bQfZrG1m8182PW/PW7OW0d1SoB/7vfTkCOkudRFhO1vJot
         UikS2YFl4jAo7NNn1G3JWae498FMt7dYgTUT56SICBsuQ0AT4yOSS343iJls1m99Fer+
         NOoA==
X-Forwarded-Encrypted: i=1; AJvYcCUPJ5/pW3xonX7+ALZDl9dDWbNK2alRv+ohKYMyjCAdpNYN26j7L3D4Xz3x2+ZEBMNA6rc/IWFNzVE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz9CtF+K4o5EkNUN9586DHrr5Tel1UBncdpg+knQcknglKqaCZ
	p6Smayw2n5RaLo8PnbufqtdPEhmtB2diq9A00S+lW1tUTRB6czd3d2U+I1rfgBCZZl0MR2V1zYK
	4gusZQl+qG+/0/DMOmC9pDKNNdyTPL+Vt+laTyWOUu2vHlEMyxrUno8y3hobFvNovm5f0AqX0BC
	zgB3daIEXsmYGt4OqPdbP7LshyTIBOMMWSDtW/niE1MODhGg/SqrmkyYUcuc7Gexow/MFxIeIp6
	klqcD8gNlibf9XcMKNN9g==
X-Gm-Gg: ASbGncslRzBXmtIxVXRK82rTNImwMMauBvAjDpAeeDHeMaZd6pvy6b0h59AAEvigeyE
	4qVOKw3hWWYumeXUDj4lKVuJWMloZF51FmsSZ19C1tMnkBuSqbzDyIa1ti9wXATGDN0RRBviTfl
	naz10rS1pOl8OUCl/qHqh5zWQsjXUNDYSk8ASPUvKtTMrEK8sutuVvYznUqvLLh0iWIrktvfKWx
	GBPo4QqE03FB6lSVcJnh42+BV/zu8cFRYZrDvPhNxCYn8Z0Oek/p4S/j+4Wv2C+UlNMUcemhubN
	G86PRDUuY2Sjgv8VAabJ/zJw7Ez/GNtAeEi9Cd+Dr3LGHy1rnr63tv0ZOhJSdYO4RavGaJhM1wk
	RCVLFE7svq13wC7UUiA9zmd9xt39rAdwug4sahdJ4Lj120XuHhw9tyye6poCkbmmYIUQiLJTLcC
	uqmtA=
X-Google-Smtp-Source: AGHT+IFDWNfV9N+pVTziW7P0gEskgIVfiTS7zPZSWB+KR3tRM501h61J0f4MaS16Mxw/mmwuk4/L3stGUyLJ
X-Received: by 2002:a05:6e02:1c21:b0:42f:8e66:e8c5 with SMTP id e9e14a558f8ab-42f8e66e945mr182629195ab.4.1760249670168;
        Sat, 11 Oct 2025 23:14:30 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-42f90244cfdsm6210235ab.1.2025.10.11.23.14.28
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 Oct 2025 23:14:30 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-62fd1b03d74so6660063a12.0
        for <brcm80211@lists.linux.dev>; Sat, 11 Oct 2025 23:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760249667; x=1760854467; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GEXjSsixXadxlJPIE/eWGIdDbJPv4Fh48J/bx1MUfAk=;
        b=C0EVMXcvkAVvEbhbzP149fHG8m7xYzvC19MbBS1OP45snlKMCXZeejzVnuqzQcdvo6
         exfyEMyiEbb8KhTz8sIGOjOLWkJU9pF6YvaVHS4hiCNLdAQkvA7U+ZINPofFdHX5QiS0
         tVz/eSglaau/9p1vagze2alf6iIB3vlTAYM+A=
X-Forwarded-Encrypted: i=1; AJvYcCUznPOiwFSmVqDzFOuzVrjQyIAwGVkv1FqtXQUnjIQWoTp7LR8X0LSmDlYobH3nc+8GsDyICAnkA/I=@lists.linux.dev
X-Received: by 2002:a05:6402:274c:b0:638:7fca:adda with SMTP id 4fb4d7f45d1cf-639d5c52c6cmr17572085a12.28.1760249667412;
        Sat, 11 Oct 2025 23:14:27 -0700 (PDT)
X-Received: by 2002:a05:6402:274c:b0:638:7fca:adda with SMTP id 4fb4d7f45d1cf-639d5c52c6cmr17572059a12.28.1760249667021;
        Sat, 11 Oct 2025 23:14:27 -0700 (PDT)
Received: from [192.168.178.137] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c133412sm6297187a12.32.2025.10.11.23.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 23:14:26 -0700 (PDT)
Message-ID: <228c2b2c-aae6-4caa-bdb4-9e9f12497b21@broadcom.com>
Date: Sun, 12 Oct 2025 08:14:24 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next] wifi: brcmfmac: fix crash while sending
 Action Frames in standalone AP Mode
To: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
Cc: brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 chris@streetlogic.pro, linux-wireless@vger.kernel.org, richard@govivid.ai,
 s311332@gmail.com, wahrenst@gmx.net, wlan-kernel-dev-list@infineon.com,
 johannes@sipsolutions.net
References: <9a0849d8-befd-4fca-9d5d-a24520ccfa26@broadcom.com>
 <20251009073928.6803-1-gokulkumar.sivakumar@infineon.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20251009073928.6803-1-gokulkumar.sivakumar@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/9/2025 9:39 AM, Gokul Sivakumar wrote:
> Currently, whenever there is a need to transmit an Action frame,
> the brcmfmac driver always uses the P2P vif to send the "actframe" IOVAR to
> firmware. The P2P interfaces were available when wpa_supplicant is managing
> the wlan interface.
> 
> However, the P2P interfaces are not created/initialized when only hostapd
> is managing the wlan interface. And if hostapd receives an ANQP Query REQ
> Action frame even from an un-associated STA, the brcmfmac driver tries
> to use an uninitialized P2P vif pointer for sending the IOVAR to firmware.
> This NULL pointer dereferencing triggers a driver crash.

Hi Gokul,

One more thing. I think the crash warrants that this patch is submitted 
against the wireless tree iso wireless-next.

Gr. AvS
