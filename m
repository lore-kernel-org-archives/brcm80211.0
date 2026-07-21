Received: from mail-yw1-f226.google.com (mail-yw1-f226.google.com [209.85.128.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AAF47DF9B
	for <brcm80211@lists.linux.dev>; Tue, 21 Jul 2026 10:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629996; cv=none; b=vAkUS0EAYInqzSDXkDsfFGqji/WzExdWLwREoCgRHYDt5Ux/OHsPYX9sF0uMdniFLqkcdKN0rm8LnDdO4LwiG6g2H5+bLaufWFPFmk869rPCIALjNa9eUCdLjd9uB7kIQjQmHaD2z2mWMWK4RYCDGO0Xh15B3NeznpWAXnXr2nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629996; c=relaxed/simple;
	bh=WLhgUnpb80hHABXwKCUlxo2YuJadWbvTqwKA3k4yvrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZgu/bkCM8Rpp8a4TEiCPUHs1p09PkuIWofJx3xuDd/Ea/JFeUZ/YZVd/bRF3ujIIci9riG2V+MOqnnCY1jqYEl7sBodM1xg/GSKY7wBhZ2odCIo/8aNS0O/cN/gLp5YkKRMZuHApYEaOmAV8g4Zyy8vcS9+bU/1UiQSGG1EcpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZTFaWaKr; arc=none smtp.client-ip=209.85.128.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZTFaWaKr"
Received: by mail-yw1-f226.google.com with SMTP id 00721157ae682-8111c0c7561so133369907b3.3
        for <brcm80211@lists.linux.dev>; Tue, 21 Jul 2026 03:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629992; x=1785234792;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lx+yZrA/ioEyz+RtWWATDgMWOm1Gl+ZtzLYIVgkvKcw=;
        b=r2Zb9RzRebblIocsGDMt+j5m6Kykr+QS1dKY5vd5cRHcRLeaWw0PCVEEnNoFHHx/Et
         BV4iCQbEk9VmCMWnnGFdPZj29fETOPL5XTqjsAdHcl9KSSjNp85jMfgFz1dz+OU3WRLH
         w/wPjKYP/2QyP2VU7aVtq7CdpYqqhF35yowafVr0CKbuB9fvrag2Qh8IDiPsa14Jz769
         fFy/whmWp+U8/WmtF//FF+U2XpYIVKWOV01yl+xp3TuZojkp9JEQXoGF20SR0Kl7XefW
         hxyLK/3o7w0ZbUvbHLcm5+yU0M2WGejLHQPoQ6ivVk8lINxi/eIoN2blYCLLBhieRB8+
         Gc3A==
X-Forwarded-Encrypted: i=1; AHgh+RrJMQI1KIv8HE4AlAeVU3K0OOoSzqEE4WpGFcKBiFpo7DamdQoMzeqITwxUbBM74e+mDmBoCSTQZsI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTzInQ2QRGSDgLytEwsc7LB6V71nxJ3JNestEiCC/d0HBLAVLS
	yJvUjiGpc7x8TkxlMGemlP3xZKaoAiBpFeJoYtEsV0qF1bcYH8PR051FGHxe93gHPwYbEJkCq4K
	RKBRZKZdMdjCOQsvpz8j2nSG8VnUS0HF2n4kOkAZtAiHmSO9R7lSbX60SaRnRXg7NR/edgC6kmv
	KVnI3/6O7vWo8mKCpdXGr4Lw5WTZzmpeQ+KDCtkDkPcUXgqcmmq/bOyWO3KfI8ULBgNcls23t5X
	ExzBjFKIuOw3PLhQQX3jA==
X-Gm-Gg: AR+sD12/OnW3psmH8N1HX9ePb+g3RU0WfMtqynNJFhNGHoziFJnF/chJ+2jCA+FtWcL
	lnkb6hpd6bzjM/wqQCDC6kSL/A211uadxk0lv0J/gHc7dnTL6vaAuOevF8mtc9dnag8af5Y6/WX
	EL2Yu5Pp2Bz8+ePVgnnjtvR+zkaMFblymff6WvjTrj73qGVdm7Fy7KO+lkv9Zxt0Rhpe6r1KA5V
	4xvixzGC/AhPL4BZolridrIH4tIxXCjdMqsLnHEJfVHFvzCbuwUiMModGUd+02mGYgfjWULcbmv
	qVrfCxNIuzDLjtqBG3LfBSlV0gf/H4xX74zRCthaR9LYm8O0KeaIoTdwKeX4JQ4QTDZ9xo94Bix
	5cUUekS8mOBu2URwZEsc33gboflBz4uHh/uD0W+NSX0v4teqmd2tbkCYfu7LM0DufXQAwbAnPvG
	uyF/DZ8Qd+l9DFmgprIz72xu2u3txYpLC1rnCh0c8=
X-Received: by 2002:a05:690c:350d:b0:80c:c7f1:96f4 with SMTP id 00721157ae682-81ef2842632mr55692307b3.51.1784629991802;
        Tue, 21 Jul 2026 03:33:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-12.dlp.protect.broadcom.com. [144.49.247.12])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-81f01875ceesm5615207b3.15.2026.07.21.03.33.11
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jul 2026 03:33:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c15c6a68406so55210766b.3
        for <brcm80211@lists.linux.dev>; Tue, 21 Jul 2026 03:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784629990; x=1785234790; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lx+yZrA/ioEyz+RtWWATDgMWOm1Gl+ZtzLYIVgkvKcw=;
        b=ZTFaWaKr/RJM2P5nA8Td2BcyBQPmWU7mvkdDKeEQW7vu0DzCsmO8dqxpzW0AmscPnI
         y66M0RQHT++hbHKeYD2lfDYOjGOKrB5mYZvZ7Ygl81IW34rHrLPEu3LVow6V058Dw53I
         1LaJfGiP6w+Tr8fUX+uAjlVbM9byAyiRAos4k=
X-Forwarded-Encrypted: i=1; AHgh+RqPNKgBFScrwuOUR+gJ0oUnRI969WQdZ+UxMXV5YB5Oj6FrRP3srSuww6JN2JO/RWjCi8QHDS0hBPU=@lists.linux.dev
X-Received: by 2002:a17:907:1c2a:b0:bff:738c:7a64 with SMTP id a640c23a62f3a-c16b487dce6mr675225966b.49.1784629990295;
        Tue, 21 Jul 2026 03:33:10 -0700 (PDT)
X-Received: by 2002:a17:907:1c2a:b0:bff:738c:7a64 with SMTP id a640c23a62f3a-c16b487dce6mr675224666b.49.1784629989860;
        Tue, 21 Jul 2026 03:33:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:3d88:a000:438:b9fe:24ed:8a4a? (2001-1c00-3d88-a000-0438-b9fe-24ed-8a4a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3d88:a000:438:b9fe:24ed:8a4a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fee3304sm6165928a12.5.2026.07.21.03.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 03:33:08 -0700 (PDT)
Message-ID: <110674ff-586b-4a28-97d1-2bc0179caaec@broadcom.com>
Date: Tue, 21 Jul 2026 12:33:11 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: cyw: clean up PMKID and cookie code
To: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20260714150423.53960-1-bogdan.nicolae@gmail.com>
 <20260720194900.2356442-2-arend.vanspriel@broadcom.com>
 <CA+ORkNQcUjZ7ufoR5ULN8UDTzxXccFcmD8=rYe=UWVV3-M15Ug@mail.gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <CA+ORkNQcUjZ7ufoR5ULN8UDTzxXccFcmD8=rYe=UWVV3-M15Ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 20/07/2026 23:30, Bogdan Nicolae wrote:
> Arend,
> 
> Sounds good. Do you prefer two patches in a single email or two separate emails?

Way easier to deal with separate emails as we use patchwork to track them.

Regards,
Arend
