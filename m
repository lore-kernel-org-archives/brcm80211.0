Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999759;
	b=GOotc6TNL/MHGkAcq7UjDUzrsckCd6xRbvQqocIEALX+TmEwnA7O/abRSCJB0eY2UXok
	 xV/70VX9AyxnO8Dq2374jgBaOgZYvQ04ZUrIHZTiGSsBWEYGgxxNkgscl1bUiYCHJpvwe
	 utRYhxJC8Pyn3DgMOV6U2Tg9v4kEzeHXOU5ZwyT5oMtFWDKrkET/KPDhH2ugfjkWG4S+2
	 JSgHOCyiO+l2UUUZbzuIVGlSncIM+KuniaYXGPyoM/0jzn94qp1RkqL7VguyFdXaiyrna
	 rlixHOF/2lxkB4B5m7TITkAoVFyHVp+n7JbdlIt0qzjlpNrzGpGLOqCLusyyfy8m1wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999759;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=c0vVjUXXO3H9pY7FsP7IBiUJJTrq9KJzbI8Ty+f7k3k=;
	b=MoS4QLayb7OjU+5v/4HfPl8h5m+XmC2AVdg+s10wtjV0RV73F8Jd6UIEp5DfyS0LaxIC
	 GWcFh45+0URCdXiBuArcISp800ZvoHHuVDJ1r/1lmUYu6R6LxLSrdwcmzBi/iCbiiTBYG
	 GLl4aIzOEJ/SbI/TMGtPnoWUGahyH6QluVEmJV4rGvzounUDZ9NMa/15xvrmBF9q8u4m0
	 TKhRxvnWFXdUEubOm+Sk1uTJpeZF7sIqzRqG+t7g2nHWR/4PJXVXIHGeCDmlQ0iYPEW8F
	 zuqSbFCaY+YBu/+upCAOxpUxWWqM1bYggJaYALKl4YtofsKYOO3eEbnuF/5Xwv0S51Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FoPyVqrv;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD6B606A32A
	for <brcm80211@lists.linux.dev>; Wed, 18 Nov 2026 11:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AD6B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FoPyVqrv
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cddc250d815so453155a12.2
        for <brcm80211@lists.linux.dev>; Wed, 18 Nov 2026 03:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999759; x=1795604559;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=c0vVjUXXO3H9pY7FsP7IBiUJJTrq9KJzbI8Ty+f7k3k=;
        b=oamLijo7TNrpm06OeWDjjHhLwbv8gYyifgDuCDY3t+9OWho9KgK5vW0IDQlLq3mRh0
         /2uz+vt+FtBmU9hMRMd6OeXI5z0DKfVPALJY4CErAj3Frs68RSErvUzZ5et5jpOlmSkE
         pCA+Uuu9ncyy7QwHmiIeZeANV8CitfHp7h0FSelx52ZOED3xK4Rbg11f2MpU+2rLTVH/
         j+dO3ncxu9cDXMj5p3WMPEyL703gQBspg/0xxVmY682N1rg7xAoVCSvoAQeW2DuOKmIU
         fz5h0kYHGga4IQYhF23p38Tl4I/TvJYx+GmSHZgeCp/Ufc6FbpDqGQIJLE/M4J05EGME
         bSNw==
X-Forwarded-Encrypted: i=1; AL+hErFb+jLKakIBsELx/uuTUNfM4ftr6tYx0wO2nupYW+5htHLXImo0501AIFiVr+fQF75sdjD+oTCSRjU=@lists.linux.dev
X-Gm-Message-State: APuU4Z9EX9yrU1Ck6IWMeiVCMMTCfI/UhhGSsU25MvO4KWcakGvYbQE+
	/QRbInkdpo4yVh5tkaa3YV5gfqh+gHYaCs9BQkcjyEFhtB+jbix2BBksJimShJw01d5S2uivYsm
	a84VkKROxkiBtRdgygEP78xACk37gYwp+C93U5ft+/iOdpDtKXc9ltJTJVgfoqM+cWa6Q0t6E+W
	blNm4Npr9N9Sz56zE35YYVaKi/xRVoXQRD46P2gVL/U6AOSs7uTdwcM7YNfP01AW8HPb/ah22a3
	mMFYMVlfbxptjfaFblJyg==
X-Gm-Gg: AZFdTZdXKucesf4DkrYSn1SxecZRM5uTfHbN/CnvdR7hrcbPQdM1FlFXISPre34WmXi
	muuYBNCtp+hAxvekdg1Sv1TyypFk8mSoCcY/WJtzm0mfuRlu6aT3OmkGdSTtTX+bDn90mbra02K
	BUVtGtZubI2S9afEVKVb035zXzYiEgXtkkfKzN0yfr0SYw3W3LjWTRoaE/oo4ul6Pv9OzXNQVUN
	MrfrdFrSj6MkK0erQ0AacgebX3jqeOwplC9fKvoqXmn4tymzq3ygg/GRHpl5fgRGjIq+FQNl6Vr
	R61oCzO9R0nbE1oGbjTEaq8NKNgF3arTom4aQ980/Rgm+cFfkUdaes+UN7otJDUs/DGnGErfwuE
	ZQLbReZkTtTcV+96VIFofE+QsWo6q/aM2hvQdDaXiu/73lv1N6iUnfL6D4TJtzXa2ZvIEwQcmMS
	faQQmABu+aOcYkkpPyEY/aaLi80cE17YZ+FDXrDtyydQ==
X-Received: by 2002:a17:90b:39c5:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3b3d07c9a75mr2702871a91.44.1794999758573;
        Wed, 18 Nov 2026 03:02:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d171b8ffsm600552a91.0.2026.11.18.03.02.37
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:02:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9210ec7cb34so19172616d6.0
        for <brcm80211@lists.linux.dev>; Wed, 18 Nov 2026 03:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794999757; x=1795604557; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0vVjUXXO3H9pY7FsP7IBiUJJTrq9KJzbI8Ty+f7k3k=;
        b=FoPyVqrvVyiYw/jK2Vl7jX7tOqeq1VdQfTUdKSCRPXPO7NrmLNa0TnnMM5ORkUEPUC
         ul4IdaZhGiDe+H0Q6muJFiOGK65bdBhXlaRhMJTX02P5oLNyj2khefI+6Azw9r3TPu4w
         2BEnSQqcMlPrtx7d/7XQcAdTD4O1LNui/CzIw=
X-Forwarded-Encrypted: i=1; AL+hErFqYCrBi5scMBxiuBO8vgWU9CBOf6T1Ru4sk9O3iPPl4T5KlKUjQidNaXZFtl5l7tefTwtXx6onXgk=@lists.linux.dev
X-Received: by 2002:a05:6214:3bc1:b0:912:517b:20e2 with SMTP id 6a1803df08f44-92114f76116mr33702636d6.42.1794999756754;
        Wed, 18 Nov 2026 03:02:36 -0800 (PST)
X-Received: by 2002:a05:6214:3bc1:b0:912:517b:20e2 with SMTP id 6a1803df08f44-92114f76116mr33702066d6.42.1794999756158;
        Wed, 18 Nov 2026 03:02:36 -0800 (PST)
Received: from [10.176.2.72] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921167f4725sm14267446d6.44.2026.11.18.03.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:02:35 -0800 (PST)
Message-ID: <bbc2eef7-e2a6-4f26-ae9a-f69caf3378ed@broadcom.com>
Date: Wed, 18 Nov 2026 12:02:35 +0100
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: Replace strlcat() with snprintf() in
 brcmf_fw_alloc_request()
To: Ping-Ke Shih <pkshih@realtek.com>,
 Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "brcm80211@lists.linux.dev" <brcm80211@lists.linux.dev>,
 "brcm80211-dev-list.pdl@broadcom.com" <brcm80211-dev-list.pdl@broadcom.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "morbo@google.com" <morbo@google.com>, "kees@kernel.org" <kees@kernel.org>,
 "justinstitt@google.com" <justinstitt@google.com>,
 "codemender-patching+linux@google.com" <codemender-patching+linux@google.com>
References: <20261014005553.71803-1-nikitash.mariiaw@gmail.com>
 <20261117133150.817227-1-arend.vanspriel@broadcom.com>
 <670492ee188945f8a3a3b147ae5b840d@realtek.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <670492ee188945f8a3a3b147ae5b840d@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 18/11/2026 03:32, Ping-Ke Shih wrote:
>> The Assisted-by: tag shows this change was produced with an LLM. Please
>> follow the guidelines in Documentation/process/generated-content.rst so
>> it is clear what was tool generated and what tool and/or LLM was used.
> 
> FYI. The Assisted-by is removed by:
> 
> 1e035297ffda ("docs: remove Assisted-by references")

Right. It is however appreciated to be transparent about the use of 
generative tools in commit message and/or change log.

Regards,
Arend

