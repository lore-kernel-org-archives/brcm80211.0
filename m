Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568EF3403F4
	for <brcm80211@lists.linux.dev>; Wed,  5 Aug 2026 06:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785909684; cv=none; b=fLpnmBsamlM69KeqjNEoaupr9nlX28BzLH/JPYPlGPQ5ZgnrqEuMfj/kpad5djhBUhR+RUf+jcgzCjk0AFkSAOqwV9eaG/GmRZb9Vd2KlB/jSHt13XAD0kkCjODh3SMFSwxVsUxkesFQeTC2o5Ypdo8e8TBK7RnL39+gAwOLANY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785909684; c=relaxed/simple;
	bh=l8bc8ytrxXEXmbcQbNdzYjz3gf5Gms+qc80pzWcDjNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pFBM8l9MP0Xy0kPU8+LmEpD5wNYBL1YtpL0RkYEimNA4zQidqf0o6f0P//kNawddqFhDq65dkeRkbt9H20Kbbh19C+naC1s+kkL7lNiWd8KO81EVALVPK4AeTBA+cUik4dXGK4+vo5XrHremlSWiSa9tgAkhmDI8z4NjvMLb690=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JgFMToUV; arc=none smtp.client-ip=209.85.222.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JgFMToUV"
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-92ed3993c1eso34195485a.1
        for <brcm80211@lists.linux.dev>; Tue, 04 Aug 2026 23:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785909682; x=1786514482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zQ/9RIR1VNN0hukmG5NlD01qt4vqhJek43rGR5IpLsY=;
        b=d9xrNuLDoi+BaUdbH+xgaEtoE/a8zwYPdsV3Ra4StQmgHIxjaUbuIBlh5lTSxwTP3p
         9XWNtUkIND0Z2W5u8vl1FjwYXQ8JT7YD+8e52vOghcWjMY/IeO2hcIon9csHnat+MP1X
         HCjAX8ksKley/RtQ7Y/5rwGZWr2sw/doIOe9QyGGV1b3wWX3xaw41Fv8+YQcRC6oJ5tK
         Nu+lL+dTwjFa3u5H3pBxA0KgLQTrnmT3zO2LH+vqp66m6gRHoXj+IPCGWqmozgnl0Mq6
         7P5iZbIaGSDDBJkIGJS0kXKBEz2gfDIaIOrpwDS4Hc3LKkmJ2BclLNyqAY8Sh7AboD0q
         jNLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+k9sZxytOlGr8v+AKHmGB7pSSIco9faZxI1q32nEACWwVE3tDcH0tjBcNtzMUehM/vEBDE974RQI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3ijX+hliFGDPqGrgpxX14wtQ+QUpxB/KiMTtaf43vDJnrSKbV
	7u07NOfui6/ufPzG1LzsQzTKhj5K+AY51k7P/7X6H9NJ/TePH2u0G1JiNipdLxstPEBkVAg7g6c
	zcj3DcTa3HczMji1/z17opfRcQT12ftNDQ1DeD0x4EZFiV4nkURBrSzc7HJU3QAv5bY3rQaD0mh
	AmQmrIsAnNlmLutekp+ObMAz+NY5jj9PFtieyNvqnLeHIv8lWgO/QpXdD8ZL/46BjREONKaHsS2
	hqSwntqn/oRx7Cgh46ewA==
X-Gm-Gg: AR+sD11Osb3mt8iCxbDkTkbOHvcKnMffmKDMJsTh+QFyXxeR6nHF/pgwdJvfzbft7KG
	B5EMkkSBlcLiT9yGEUrgoqVZYoGT+lnRkwZqj2SxVvwzrOLjWkXPu8/N+uruWxEps9NY5b+36yV
	fyeQSAPFQ5PGYKcyA2ZJN8p02APhcd0W2FtxtpABIwKlXReD7zB0jd3AVDu9Tsp6DPO8JnfSoVp
	nB/z9yyfz7fyaLR69sTJBitsRkhDpE7PGfdw3s8yIZdvIoClFfcJvUNS7b4C0Kays+e+j9dOsoe
	jc18IOOAVIdHZnOdazXtefAyBh4YjKzzSuOHZjgs8o/eN+m41yE0sUO++8Qiz7+SAcdkmK0KPru
	YVTiJ4RhwU5fzb+EdhiwLDQL5LcXsP9s0xzlSzqB+DgYb+XTe8z7ureuePMuhTV2yHkjld2qqJe
	bBp0rhcBUK0cZRGj004xtHDdC7w2YGburx0j/7K9Q=
X-Received: by 2002:a05:620a:5e03:b0:934:8241:5fa3 with SMTP id af79cd13be357-936492ac529mr292059985a.37.1785909681932;
        Tue, 04 Aug 2026 23:01:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9364a541639sm21641085a.6.2026.08.04.23.01.21
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Aug 2026 23:01:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso5993121cf.2
        for <brcm80211@lists.linux.dev>; Tue, 04 Aug 2026 23:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785909681; x=1786514481; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQ/9RIR1VNN0hukmG5NlD01qt4vqhJek43rGR5IpLsY=;
        b=JgFMToUVbNtf4YuWCcfRJVSwAl5+4DAiLQmPy4siR78VQ/np+f7+EszIIRGdt3Vf9I
         5LRt1m808nC5MoYEjgU5e5wcyxMw3MUIkpwIGA7FN7K/ZMh5dMB3WA1Jc/o8uwSutkvd
         AodA8OV3xHrnLl9O4URxynxToR0qJJ7YSfSj8=
X-Forwarded-Encrypted: i=1; AHgh+Ro/zm7RrvMdWutQcGFN/5F3eUwtVLNcxU7le0QwpLNpXiFXihoI8d3P534834sL/jwui6jHC6N8HTw=@lists.linux.dev
X-Received: by 2002:a05:622a:355:b0:519:8998:661b with SMTP id d75a77b69052e-52ce60c07c6mr43080081cf.20.1785909681069;
        Tue, 04 Aug 2026 23:01:21 -0700 (PDT)
X-Received: by 2002:a05:622a:355:b0:519:8998:661b with SMTP id d75a77b69052e-52ce60c07c6mr43075121cf.20.1785909674142;
        Tue, 04 Aug 2026 23:01:14 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ff9d720sm18740276d6.4.2026.08.04.23.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 23:01:13 -0700 (PDT)
Message-ID: <8338ad7e-8707-473c-b677-be3594f7a7f5@broadcom.com>
Date: Wed, 5 Aug 2026 08:01:11 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: brcmfmac: remove extra blank lines in msgbuf.c
To: Can Peng <pengcan@kylinos.cn>, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20260803080912.553948-1-pengcan@kylinos.cn>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260803080912.553948-1-pengcan@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 03/08/2026 10:09, Can Peng wrote:
> msgbuf.c uses two blank lines in many places, including between
> top-level declarations and functions.
> 
> Keep a single blank line instead to match common kernel coding style.

Yeah. It has been like that since this source file was added so maybe 
just leave it like it is and forget I ever mentioned it.

Regards,
Arend

> Reviewed-by: johannes@sipsolutions.net
> Reviewed-by: arend.vanspriel@broadcom.com
> Signed-off-by: Can Peng <pengcan@kylinos.cn>
